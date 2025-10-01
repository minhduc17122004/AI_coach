import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskaholic/core/di/di.dart';
import 'package:taskaholic/core/routes/app_routes.dart';
import 'package:taskaholic/core/themes/app_color.dart';
import 'package:taskaholic/core/utils/category_constants.dart';
import 'package:taskaholic/features/home/presentation/widgets/app_bar.dart';
import 'package:taskaholic/features/home/presentation/widgets/category_title_dropdown.dart';
import 'package:taskaholic/features/home/presentation/widgets/empty_state.dart';
import 'package:taskaholic/features/home/presentation/widgets/task_group.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_bloc.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_event.dart' as task_events;
import 'package:taskaholic/features/home/presentation/bloc/home_bloc.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_event.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_state.dart';
import 'package:taskaholic/features/home/presentation/pages/completed_page.dart';
import 'package:taskaholic/features/home/presentation/pages/search_page.dart';
import 'package:taskaholic/features/home/presentation/pages/profile_page.dart';
import 'package:taskaholic/features/home/presentation/pages/notifications_page.dart';
import 'package:taskaholic/features/chat/presentation/pages/category_page.dart';
import 'package:taskaholic/features/chat/presentation/widgets/add_category_dialog.dart';
import 'package:taskaholic/features/task/domain/entities/task_entity.dart';
import 'package:taskaholic/shared/widgets/default_bottom_bar.dart';

// Auth imports for logout functionality
import 'package:taskaholic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taskaholic/features/auth/presentation/bloc/auth_event.dart';
import 'package:taskaholic/features/auth/presentation/bloc/auth_state.dart';
import 'package:taskaholic/features/auth/presentation/pages/login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(const LoadTasksEvent()),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  static const List<String> _titles = [
    'Trang chủ',
    'Kế hoạch',
    'Trò chuyện',
    'Hồ sơ',
  ];

  Widget _getPageAtIndex(int index, HomeState state) {
    switch (index) {
      case 0:
        return _HomeTab(homeState: state);
      case 1:
        return const CompletedContent();
      case 2:
        return const CategoryContent();
      case 3:
        return const ProfilePage();
      default:
        return _HomeTab(homeState: state);
    }
  }

  Widget _getLeadingIcon(int index) {
    switch (index) {
      case 0:
        return const Icon(Icons.home, color: AppColors.textOnPrimary, size: 28);
      case 1:
        return const Icon(Icons.calendar_today_outlined, color: AppColors.textOnPrimary, size: 28);
      case 2:
        return const Icon(Icons.chat_bubble_outline, color: AppColors.textOnPrimary, size: 28);
      case 3:
        return const Icon(Icons.person_outline, color: AppColors.textOnPrimary, size: 28);
      default:
        return const Icon(Icons.home, color: AppColors.textOnPrimary, size: 28);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: CustomAppBar(
            title: (getCurrentIndex(state) == 0 || getCurrentIndex(state) == 1) ? null : _titles[getCurrentIndex(state)],
            titleWidget: (getCurrentIndex(state) == 0 || getCurrentIndex(state) == 1) 
                ? CategoryTitleDropdown(
                    selectedCategoryId: getSelectedCategoryId(state),
                    onCategoryChanged: (categoryId, categoryName) {
                      context.read<HomeBloc>().add(ChangeCategoryEvent(categoryId));
                    },
                    showTaskCount: true,
                    taskCount: getTaskCount(state),
                  )
                : null,
            showBackButton: false,
            leadingIcon: _getLeadingIcon(getCurrentIndex(state)),
            actions: [
              if (getCurrentIndex(state) == 0 || getCurrentIndex(state) == 1) ...[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<HomeBloc>(),
                          child: const SearchPage(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search, color: AppColors.textOnPrimary),
                  tooltip: 'Tìm kiếm',
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<HomeBloc>(),
                          child: const NotificationsPage(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications, color: AppColors.textOnPrimary),
                  tooltip: 'Thông báo',
                ),
              ],
              if (getCurrentIndex(state) == 2) ...[
                IconButton(
                  onPressed: () => _showAddCategoryDialog(context),
                  icon: const Icon(Icons.add, color: AppColors.textOnPrimary),
                  tooltip: 'Thêm danh mục',
                ),
              ],
              if (getCurrentIndex(state) == 3) ...[
                IconButton(
                  onPressed: () => _handleLogout(context),
                  icon: const Icon(Icons.logout, color: AppColors.textOnPrimary),
                  tooltip: 'Đăng xuất',
                ),
              ],
            ],
          ),
          body: _getPageAtIndex(getCurrentIndex(state), state),
          bottomNavigationBar: DefaultBottomNavBar(
            currentIndex: getCurrentIndex(state),
            onTap: (index) {
              context.read<HomeBloc>().add(ChangeTabEvent(index));
            },
          ),
        );
      },
    );
  }

  int getCurrentIndex(HomeState state) {
    if (state is HomeInitial) return state.currentIndex;
    if (state is HomeLoaded) return state.currentIndex;
    if (state is HomeLoading) return state.currentIndex;
    if (state is HomeError) return state.currentIndex;
    return 0;
  }

  String getSelectedCategoryId(HomeState state) {
    if (state is HomeInitial) return state.selectedCategoryId;
    if (state is HomeLoaded) return state.selectedCategoryId;
    if (state is HomeLoading) return state.selectedCategoryId;
    if (state is HomeError) return state.selectedCategoryId;
    return 'all';
  }

  int getTaskCount(HomeState state) {
    if (state is HomeLoaded) {
      return state.countTasksInCategory(state.selectedCategoryId);
    }
    return 0;
  }

  void _showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddCategoryDialog(
        onCategoryAdded: (categoryName) {
          // TODO: Add category to state/bloc
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đã thêm danh mục: $categoryName'),
              backgroundColor: AppColors.primary,
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Đăng xuất',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng?',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Hủy',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Unauthenticated) {
                // Close dialog first
                Navigator.of(context).pop();
                // Navigate to login page
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              } else if (state is AuthError) {
                // Close dialog and show error
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Lỗi đăng xuất: ${state.message}'),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
            },
            child: TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
              },
              child: const Text(
                'Đăng xuất',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final HomeState homeState;
  
  const _HomeTab({required this.homeState});

  void _handleAddTask(BuildContext context, String selectedCategoryId) {
    // Convert category ID to real category name, or null if 'all'
    String? initialCategory;
    if (selectedCategoryId != 'all') {
      final categoryData = CategoryConstants.getCategoryById(selectedCategoryId);
      initialCategory = categoryData?.name;
    }
    
    Navigator.pushNamed(
      context,
      AppRoutes.taskForm,
      arguments: {'initialCategory': initialCategory},
    ).then((_) {
      // Add small delay to ensure task is fully saved before refreshing
      Future.delayed(const Duration(milliseconds: 300), () {
        if (context.mounted) {
          // Refresh tasks when returning from TaskFormPage
          context.read<HomeBloc>().add(const RefreshTasksEvent());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (homeState is HomeLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    if (homeState is HomeError) {
      final errorState = homeState as HomeError;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Lỗi: ${errorState.message}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<HomeBloc>().add(const LoadTasksEvent()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (homeState is HomeLoaded) {
      final loadedState = homeState as HomeLoaded;
      final selectedCategoryId = loadedState.selectedCategoryId;
      final tasksToShow = loadedState.getTasksByCategory(selectedCategoryId);
      
      if (tasksToShow.isEmpty) {
        return EmptyState(
          currentList: selectedCategoryId == 'all' ? 'Tất cả' : selectedCategoryId,
          onAddTask: () => _handleAddTask(context, selectedCategoryId),
        );
      }

      // Group tasks by date categories
      final tasksByCategory = loadedState.getTasksByCategoryForCategory(selectedCategoryId);
      final totalTasks = tasksToShow.length;
      final currentListName = selectedCategoryId == 'all' ? 'Danh sách tất cả' : selectedCategoryId;

      return TaskGroupView(
        tasksByCategory: tasksByCategory,
        currentList: currentListName,
        totalTasks: totalTasks,
        addTaskCard: _buildAddTaskCard(context, selectedCategoryId),
        buildCategorySection: (categoryName, tasks, color) {
          return TaskCategorySection(
            categoryName: categoryName,
            tasks: tasks,
            accentColor: color,
            onTaskTap: (task) => _handleTaskTap(context, task),
            onTaskToggle: (task, value) => _handleTaskToggle(context, task),
          );
        },
      );
    }

    // Default state (HomeInitial)
    return EmptyState(
      currentList: 'Tất cả',
      onAddTask: () => _handleAddTask(context, 'all'),
    );
  }

  Widget _buildAddTaskCard(BuildContext context, String selectedCategoryId) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.05),
            AppColors.secondary.withValues(alpha: 0.03),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _handleAddTask(context, selectedCategoryId),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary.withValues(alpha: 0.2),
                        AppColors.secondary.withValues(alpha: 0.15),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thêm nhiệm vụ mới',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tạo nhiệm vụ trong ${selectedCategoryId == 'all' ? 'bất kỳ danh mục nào' : selectedCategoryId}',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTaskTap(BuildContext context, TaskEntity task) {
    // Navigate directly to edit task page
    Navigator.pushNamed(
      context,
      AppRoutes.taskEdit,
      arguments: task,
    ).then((_) {
      context.read<HomeBloc>().add(const RefreshTasksEvent());
    });
  }

  void _handleTaskToggle(BuildContext context, TaskEntity task) {
    // Get TaskBloc and toggle the task
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
    
    // Refresh home tasks to show updated state
    Future.delayed(const Duration(milliseconds: 500), () {
      if (context.mounted) {
        context.read<HomeBloc>().add(const RefreshTasksEvent());
      }
    });
  }
}