import 'package:flutter/material.dart';
import 'package:taskaholic/core/themes/app_color.dart';

class DefaultBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const DefaultBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, -5),
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.textOnPrimary,
          unselectedItemColor: AppColors.textOnPrimary.withValues(alpha: 0.6),
          selectedFontSize: 13,
          unselectedFontSize: 11,
          elevation: 0,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
          ),
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.home_outlined, Icons.home, 0),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.check_circle_outline, Icons.check_circle, 1),
              label: 'Hoàn thành',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.category_outlined, Icons.category, 2),
              label: 'Danh mục',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.settings_outlined, Icons.settings, 3),
              label: 'Cài đặt',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData unselectedIcon, IconData selectedIcon, int index) {
    final isSelected = currentIndex == index;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected 
            ? Colors.white.withValues(alpha: 0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isSelected 
            ? Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              )
            : null,
      ),
      child: Icon(
        isSelected ? selectedIcon : unselectedIcon,
        size: isSelected ? 26 : 24,
        color: isSelected 
            ? AppColors.textOnPrimary
            : AppColors.textOnPrimary.withValues(alpha: 0.6),
      ),
    );
  }
}
