import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaholic/core/themes/app_color.dart';
import 'package:taskaholic/core/routes/app_routes.dart';
import 'package:taskaholic/core/di/di.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_bloc.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_state.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_event.dart';
import 'package:taskaholic/features/task/domain/entities/task_entity.dart';
import 'package:taskaholic/features/home/presentation/widgets/task_card.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_bloc.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_event.dart' as task_events;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<TaskEntity> _filterTasks(List<TaskEntity> tasks, String query) {
    if (query.isEmpty) return [];
    
    final lowerQuery = query.toLowerCase();
    return tasks.where((task) {
      final titleMatch = task.title.toLowerCase().contains(lowerQuery);
      final categoryMatch = task.category?.toLowerCase().contains(lowerQuery) ?? false;
      final repeatMatch = task.repeat.toLowerCase().contains(lowerQuery);
      
      return titleMatch || categoryMatch || repeatMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: 'Tìm kiếm nhiệm vụ...',
            hintStyle: TextStyle(
              color: AppColors.textSecondary.withValues(alpha: 0.6),
              fontSize: 18,
            ),
            border: InputBorder.none,
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: AppColors.textSecondary),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _searchQuery = '';
                      });
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            final allTasks = [...state.tasks];
            final filteredTasks = _filterTasks(allTasks, _searchQuery);

            if (_searchQuery.isEmpty) {
              return _buildEmptySearch();
            }

            if (filteredTasks.isEmpty) {
              return _buildNoResults();
            }

            return _buildSearchResults(filteredTasks);
          }

          return _buildEmptySearch();
        },
      ),
    );
  }

  Widget _buildEmptySearch() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.1),
                  AppColors.secondary.withValues(alpha: 0.05),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.search,
              size: 64,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Tìm kiếm nhiệm vụ',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Nhập tên, danh mục hoặc từ khóa',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.error.withValues(alpha: 0.1),
                  AppColors.error.withValues(alpha: 0.05),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.search_off,
              size: 64,
              color: AppColors.error,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Không tìm thấy kết quả',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Thử tìm với từ khóa khác',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<TaskEntity> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Tìm thấy ${tasks.length} kết quả',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(
                task: task,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.taskEdit,
                    arguments: task,
                  ).then((_) {
                    // Refresh after editing
                    context.read<HomeBloc>().add(const RefreshTasksEvent());
                  });
                },
                onToggle: (value) {
                  // Toggle task completion
                  final taskBloc = sl<TaskBloc>();
                  taskBloc.add(task_events.ToggleTaskEvent(task.id));
                  
                  // Show feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        task.isCompleted ? 'Đã hủy hoàn thành: ${task.title}' : 'Đã hoàn thành: ${task.title}',
                      ),
                      backgroundColor: AppColors.primary,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                  
                  // Refresh tasks
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (context.mounted) {
                      context.read<HomeBloc>().add(const RefreshTasksEvent());
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
