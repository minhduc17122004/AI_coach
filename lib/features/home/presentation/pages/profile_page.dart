import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaholic/core/themes/app_color.dart';
import 'package:taskaholic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taskaholic/features/auth/presentation/bloc/auth_state.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_bloc.dart';
import 'package:taskaholic/features/home/presentation/bloc/home_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.cardBackground,
            AppColors.background,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildProfileHeader(authState),
                const SizedBox(height: 32),
                _buildStatisticsSection(context),
                const SizedBox(height: 24),
                _buildSettingsSection(context),
                const SizedBox(height: 24),
                _buildAboutSection(context),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(AuthState authState) {
    String displayName = 'Người dùng';
    String email = '';
    
    if (authState is Authenticated) {
      displayName = authState.user.displayName ?? authState.user.email.split('@')[0];
      email = authState.user.email;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.15),
            AppColors.secondary.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.3),
                  AppColors.secondary.withValues(alpha: 0.2),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 60,
              color: AppColors.textOnPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            displayName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int totalTasks = 0;
        int completedTasks = 0;
        int pendingTasks = 0;
        
        if (state is HomeLoaded) {
          totalTasks = state.tasks.length + state.completedTasks.length;
          completedTasks = state.completedTasks.length;
          pendingTasks = state.tasks.length;
        }

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Thống kê',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    'Tổng số',
                    totalTasks.toString(),
                    Icons.list_alt,
                    AppColors.primary,
                  ),
                  _buildStatItem(
                    'Đang làm',
                    pendingTasks.toString(),
                    Icons.pending_actions,
                    AppColors.secondary,
                  ),
                  _buildStatItem(
                    'Hoàn thành',
                    completedTasks.toString(),
                    Icons.check_circle,
                    AppColors.success,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.palette,
            title: 'Giao diện',
            subtitle: 'Chế độ tối',
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // TODO: Implement theme switching
              },
              activeColor: AppColors.primary,
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          _buildSettingsTile(
            icon: Icons.notifications,
            title: 'Thông báo',
            subtitle: 'Nhận thông báo nhiệm vụ',
            onTap: () {
              // TODO: Navigate to notification settings
            },
          ),
          const Divider(height: 1, color: AppColors.divider),
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Ngôn ngữ',
            subtitle: 'Tiếng Việt',
            onTap: () {
              // TODO: Navigate to language settings
            },
          ),
          const Divider(height: 1, color: AppColors.divider),
          _buildSettingsTile(
            icon: Icons.backup,
            title: 'Sao lưu & Khôi phục',
            subtitle: 'Quản lý dữ liệu của bạn',
            onTap: () {
              // TODO: Navigate to backup settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.help_outline,
            title: 'Trợ giúp & Hỗ trợ',
            onTap: () {
              _showInfoDialog(
                context,
                'Trợ giúp & Hỗ trợ',
                'Nếu bạn cần trợ giúp, vui lòng liên hệ với chúng tôi qua email: support@taskaholic.com',
              );
            },
          ),
          const Divider(height: 1, color: AppColors.divider),
          _buildSettingsTile(
            icon: Icons.privacy_tip,
            title: 'Chính sách bảo mật',
            onTap: () {
              _showInfoDialog(
                context,
                'Chính sách bảo mật',
                'Chúng tôi cam kết bảo vệ quyền riêng tư của bạn. Dữ liệu của bạn được mã hóa và lưu trữ an toàn.',
              );
            },
          ),
          const Divider(height: 1, color: AppColors.divider),
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: 'Về ứng dụng',
            subtitle: 'Phiên bản 1.0.0',
            onTap: () {
              _showInfoDialog(
                context,
                'Về Taskaholic',
                'Taskaholic - Ứng dụng quản lý công việc thông minh\n\nPhiên bản: 1.0.0\nĐược phát triển với ❤️ bằng Flutter',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.15),
              AppColors.secondary.withValues(alpha: 0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            )
          : null,
      trailing: trailing ??
          (onTap != null
              ? Icon(Icons.chevron_right, color: AppColors.textSecondary)
              : null),
      onTap: onTap,
    );
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Đóng',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
