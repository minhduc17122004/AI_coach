import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaholic/core/themes/app_color.dart';
import 'package:taskaholic/core/routes/app_routes.dart';
import 'package:taskaholic/core/di/di.dart';
import 'package:taskaholic/core/utils/category_constants.dart';
import 'package:taskaholic/features/home/presentation/widgets/empty_state.dart';
import 'package:taskaholic/features/home/presentation/widgets/task_group.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_bloc.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_state.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_event.dart';
import 'package:taskaholic/features/task/presentation/pages/task_form_page.dart';
import 'package:taskaholic/features/task/domain/entities/task_entity.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_bloc.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_event.dart' as task_events;

// Shared content widget that can be used in both standalone page and as tab content
class CompletedContent extends StatelessWidget {
  const CompletedContent({super.key});

  void _handleAddTask(BuildContext context, String selectedCategoryId) {
    // Convert category ID to real category name, or null if 'all'
    String? initialCategory;
    if (selectedCategoryId != 'all') {
      final categoryData = CategoryConstants.getCategoryById(selectedCategoryId);
      initialCategory = categoryData?.name;
    }
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFormPage(
          initialCategory: initialCategory,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (state is HomeError) {
          final errorState = state;
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
                    color: AppColors.textPrimaryDark,
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

        if (state is HomeLoaded) {
          final loadedState = state;
          final selectedCategoryId = loadedState.selectedCategoryId;
          
          // Get completed tasks for the selected category
          final completedTasks = _getCompletedTasksByCategory(loadedState.completedTasks, selectedCategoryId);
          
          if (completedTasks.isEmpty) {
            return EmptyState(
              currentList: selectedCategoryId == 'all' ? 'Hoàn thành - Tất cả' : 'Hoàn thành - ${CategoryConstants.getCategoryById(selectedCategoryId)?.name ?? selectedCategoryId}',
              onAddTask: () => _handleAddTask(context, selectedCategoryId),
            );
          }

          // Group completed tasks by category
          final tasksByCategory = _groupCompletedTasksByCategory(completedTasks);
          final currentListName = selectedCategoryId == 'all' ? 'Hoàn thành - Tất cả' : 'Hoàn thành - ${CategoryConstants.getCategoryById(selectedCategoryId)?.name}';

          return TaskGroupView(
            tasksByCategory: tasksByCategory,
            currentList: currentListName,
            totalTasks: completedTasks.length,
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
          currentList: 'Hoàn thành - Tất cả',
          onAddTask: () => _handleAddTask(context, 'all'),
        );
      },
    );
  }

  List<TaskEntity> _getCompletedTasksByCategory(List<TaskEntity> allCompletedTasks, String categoryId) {
    if (categoryId == 'all') {
      return allCompletedTasks;
    } else {
      final categoryData = CategoryConstants.getCategoryById(categoryId);
      final categoryName = categoryData?.name;
      
      if (categoryName == null) return [];
      
      return allCompletedTasks.where((task) => task.category == categoryName).toList();
    }
  }

  Map<String, List<TaskEntity>> _groupCompletedTasksByCategory(List<TaskEntity> completedTasks) {
    // Group by actual category, not by date
    final Map<String, List<TaskEntity>> tasksByCategory = {};
    
    for (var task in completedTasks) {
      final categoryName = task.category ?? 'Không có danh mục';
      if (!tasksByCategory.containsKey(categoryName)) {
        tasksByCategory[categoryName] = [];
      }
      tasksByCategory[categoryName]!.add(task);
    }
    
    return tasksByCategory;
  }

  Widget _buildAddTaskCard(BuildContext context, String selectedCategoryId) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        title: const Text(
          'Thêm nhiệm vụ mới',
          style: TextStyle(
            color: AppColors.textPrimaryDark,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Tạo nhiệm vụ trong ${selectedCategoryId == 'all' ? 'bất kỳ danh mục nào bạn muốn' : CategoryConstants.getCategoryById(selectedCategoryId)?.name ?? selectedCategoryId}',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.textSecondary,
          size: 16,
        ),
        onTap: () => _handleAddTask(context, selectedCategoryId),
      ),
    );
  }

  void _handleTaskTap(BuildContext context, TaskEntity task) {
    // Show action bottom sheet for completed tasks
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
            Text(
              task.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.restore, color: AppColors.primary),
              title: const Text(
                'Khôi phục nhiệm vụ',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                _handleRestoreTask(context, task);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: AppColors.secondary),
              title: const Text(
                'Chỉnh sửa',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  AppRoutes.taskEdit,
                  arguments: task,
                ).then((_) {
                  context.read<HomeBloc>().add(const RefreshTasksEvent());
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: AppColors.error),
              title: const Text(
                'Xóa vĩnh viễn',
                style: TextStyle(color: AppColors.error),
              ),
              onTap: () {
                Navigator.pop(context);
                _handleDeleteTask(context, task);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _handleRestoreTask(BuildContext context, TaskEntity task) {
    // Toggle task completion status (restore)
    final taskBloc = sl<TaskBloc>();
    taskBloc.add(task_events.ToggleTaskEvent(task.id));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã khôi phục: ${task.title}'),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Hoàn tác',
          textColor: AppColors.textOnPrimary,
          onPressed: () {
            // Toggle back
            taskBloc.add(task_events.ToggleTaskEvent(task.id));
            Future.delayed(const Duration(milliseconds: 500), () {
              if (context.mounted) {
                context.read<HomeBloc>().add(const RefreshTasksEvent());
              }
            });
          },
        ),
      ),
    );
    
    // Refresh tasks to show updated state
    Future.delayed(const Duration(milliseconds: 500), () {
      if (context.mounted) {
        context.read<HomeBloc>().add(const RefreshTasksEvent());
      }
    });
  }

  void _handleDeleteTask(BuildContext context, TaskEntity task) {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Xóa nhiệm vụ',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Bạn có chắc chắn muốn xóa vĩnh viễn nhiệm vụ "${task.title}"? Hành động này không thể hoàn tác.',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Hủy',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              final taskBloc = sl<TaskBloc>();
              taskBloc.add(task_events.DeleteTaskEvent(task.id));
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Đã xóa: ${task.title}'),
                  backgroundColor: AppColors.error,
                  duration: const Duration(seconds: 2),
                ),
              );
              
              // Refresh tasks
              Future.delayed(const Duration(milliseconds: 500), () {
                if (context.mounted) {
                  context.read<HomeBloc>().add(const RefreshTasksEvent());
                }
              });
            },
            child: const Text(
              'Xóa',
              style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _handleTaskToggle(BuildContext context, TaskEntity task) {
    // Quick toggle - restore task
    final taskBloc = sl<TaskBloc>();
    taskBloc.add(task_events.ToggleTaskEvent(task.id));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          task.isCompleted ? 'Đã khôi phục: ${task.title}' : 'Đã hoàn thành: ${task.title}',
        ),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
    
    // Refresh tasks to show updated state
    Future.delayed(const Duration(milliseconds: 500), () {
      if (context.mounted) {
        context.read<HomeBloc>().add(const RefreshTasksEvent());
      }
    });
  }
}

// Standalone page that shares AppBar with HomePage
class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CompletedContent();
  }
}