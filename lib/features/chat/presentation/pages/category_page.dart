import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaholic/core/themes/app_color.dart';
import 'package:taskaholic/core/utils/category_constants.dart';
import 'package:taskaholic/features/home/presentation/widgets/app_bar.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_bloc.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_state.dart';
import 'package:taskaholic/features/chat/presentation/widgets/add_category_dialog.dart';

/// Standalone page with AppBar for direct navigation
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryContentWithSearch();
  }
}

/// Content widget with SearchableAppBar - for standalone use
class CategoryContentWithSearch extends StatefulWidget {
  const CategoryContentWithSearch({super.key});

  @override
  State<CategoryContentWithSearch> createState() => _CategoryContentWithSearchState();
}

class _CategoryContentWithSearchState extends State<CategoryContentWithSearch> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<CategoryData> get _filteredCategories {
    final taskCategories = CategoryConstants.taskCategories;
    if (_searchQuery.isEmpty) {
      return taskCategories;
    }
    return taskCategories.where((category) => 
      category.name.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  Map<String, int> _getTaskCounts(HomeState state) {
    final Map<String, int> taskCounts = {};
    
    if (state is HomeLoaded) {
      for (var category in CategoryConstants.taskCategories) {
        taskCounts[category.id] = state.countTasksInCategory(category.id);
      }
    }
    
    return taskCounts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: SearchableAppBar(
        title: 'Trò chuyện',
        searchHint: 'Tìm kiếm trò chuyện...',
        onSearchChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
        searchController: _searchController,
        actions: [
          IconButton(
            onPressed: _showAddCategoryDialog,
            icon: const Icon(Icons.add, color: AppColors.textOnPrimary),
            tooltip: 'Thêm trò chuyện',
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final taskCounts = _getTaskCounts(state);
          
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.backgroundDark.withValues(alpha: 0.9),
                  AppColors.backgroundDark,
                ],
              ),
            ),
            child: _filteredCategories.isEmpty 
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = _filteredCategories[index];
                    final taskCount = taskCounts[category.id] ?? 0;
                    return CategoryCard(
                      category: category,
                      taskCount: taskCount,
                      onTap: () => _handleCategoryTap(category),
                    );
                  },
                ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: AppColors.textSecondary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Không tìm thấy trò chuyện',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Thử tìm kiếm với từ khóa khác',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCategoryTap(CategoryData category) {
    // Show category details dialog
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textSecondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                size: 48,
                color: category.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              category.name,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.task_alt, color: AppColors.primary),
              title: const Text(
                'Xem nhiệm vụ',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Hiển thị nhiệm vụ: ${category.name}'),
                    backgroundColor: category.color,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AddCategoryDialog(
        onCategoryAdded: (categoryName) {
          // Add category functionality
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đã thêm trò chuyện: $categoryName'),
              backgroundColor: AppColors.primary,
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}

/// Content widget without AppBar - can be used in tabs
class CategoryContent extends StatefulWidget {
  const CategoryContent({super.key});

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  Map<String, int> _getTaskCounts(HomeState state) {
    final Map<String, int> taskCounts = {};
    
    if (state is HomeLoaded) {
      for (var category in CategoryConstants.taskCategories) {
        taskCounts[category.id] = state.countTasksInCategory(category.id);
      }
    }
    
    return taskCounts;
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoryConstants.taskCategories;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final taskCounts = _getTaskCounts(state);
        
        return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background.withValues(alpha: 0.9),
            AppColors.background,
          ],
        ),
      ),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final taskCount = taskCounts[category.id] ?? 0;
              return CategoryCard(
                category: category,
                taskCount: taskCount,
                onTap: () => _handleCategoryTap(category),
              );
            },
          ),
        );
      },
    );
  }

  void _handleCategoryTap(CategoryData category) {
    // Show category details
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textSecondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                size: 48,
                color: category.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              category.name,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.task_alt, color: AppColors.primary),
              title: const Text(
                'Xem nhiệm vụ',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Hiển thị nhiệm vụ: ${category.name}'),
                    backgroundColor: category.color,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

/// CategoryCard widget - Reusable card for displaying category info
class CategoryCard extends StatelessWidget {
  final CategoryData category;
  final int taskCount;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.taskCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: category.color.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Category Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: category.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  category.icon,
                  color: category.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              
              // Category Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                        color: AppColors.categoryFinance,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$taskCount tin nhắn',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textSecondary.withValues(alpha: 0.6),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// CategoryStats widget - For displaying category statistics
class CategoryStats extends StatelessWidget {
  final Map<String, int> taskCounts;

  const CategoryStats({
    super.key,
    required this.taskCounts,
  });

  @override
  Widget build(BuildContext context) {
    final totalTasks = taskCounts.values.fold(0, (a, b) => a + b);
    final activeCategories = taskCounts.values.where((count) => count > 0).length;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              'Tổng tin nhắn',
              totalTasks.toString(),
              Icons.assignment,
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: AppColors.primary.withValues(alpha: 0.3),
          ),
          Expanded(
            child: _buildStatItem(
              'Trò chuyện đang dùng',
              activeCategories.toString(),
              Icons.category,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
