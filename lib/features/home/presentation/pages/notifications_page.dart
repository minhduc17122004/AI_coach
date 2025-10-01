import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaholic/core/themes/app_color.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_bloc.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_state.dart';
import 'package:taskaholic/features/task/domain/entities/task_entity.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
        title: const Text(
          'Thông báo',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: AppColors.primary),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Đã đánh dấu tất cả là đã đọc'),
                  backgroundColor: AppColors.primary,
                  duration: Duration(seconds: 1),
                ),
              );
            },
            tooltip: 'Đánh dấu tất cả đã đọc',
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            final upcomingTasks = _getUpcomingTasks(state.tasks);
            final overdueTasks = _getOverdueTasks(state.tasks);
            
            if (upcomingTasks.isEmpty && overdueTasks.isEmpty) {
              return _buildEmptyState();
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (overdueTasks.isNotEmpty) ...[
                  _buildSectionHeader('Quá hạn', overdueTasks.length, Colors.red),
                  ...overdueTasks.map((task) => _buildNotificationItem(
                    context,
                    task,
                    'Nhiệm vụ đã quá hạn',
                    Icons.warning,
                    Colors.red,
                  )),
                  const SizedBox(height: 16),
                ],
                if (upcomingTasks.isNotEmpty) ...[
                  _buildSectionHeader('Sắp tới', upcomingTasks.length, AppColors.primary),
                  ...upcomingTasks.map((task) => _buildNotificationItem(
                    context,
                    task,
                    'Nhiệm vụ sắp đến hạn',
                    Icons.schedule,
                    AppColors.primary,
                  )),
                ],
              ],
            );
          }

          return _buildEmptyState();
        },
      ),
    );
  }

  List<TaskEntity> _getUpcomingTasks(List<TaskEntity> tasks) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final nextWeek = today.add(const Duration(days: 7));

    return tasks.where((task) {
      if (task.date == null) return false;
      final taskDate = DateTime(task.date!.year, task.date!.month, task.date!.day);
      return (taskDate.isAtSameMomentAs(today) || 
              taskDate.isAtSameMomentAs(tomorrow) ||
              (taskDate.isAfter(today) && taskDate.isBefore(nextWeek)));
    }).toList()..sort((a, b) => a.date!.compareTo(b.date!));
  }

  List<TaskEntity> _getOverdueTasks(List<TaskEntity> tasks) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return tasks.where((task) {
      if (task.date == null) return false;
      final taskDate = DateTime(task.date!.year, task.date!.month, task.date!.day);
      return taskDate.isBefore(today);
    }).toList()..sort((a, b) => b.date!.compareTo(a.date!));
  }

  Widget _buildEmptyState() {
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
                  AppColors.success.withValues(alpha: 0.1),
                  AppColors.success.withValues(alpha: 0.05),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_none,
              size: 64,
              color: AppColors.success,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Không có thông báo mới',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Bạn đã xử lý hết mọi việc!',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    TaskEntity task,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withValues(alpha: 0.2),
                color.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          task.title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text(
                  task.getFormattedDate(),
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
                if (task.hasTime) ...[
                  const SizedBox(width: 12),
                  Icon(Icons.access_time, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    task.getFormattedTime(),
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
        ),
        onTap: () {
          // TODO: Navigate to task detail
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Xem chi tiết: ${task.title}'),
              backgroundColor: color,
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
