import 'package:flutter/material.dart';

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
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home_outlined, Icons.home, 0, 'Trang chủ'),
            _buildNavItem(Icons.calendar_today_outlined, Icons.calendar_today, 1, 'Kế hoạch'),
            _buildNavItem(Icons.chat_bubble_outline, Icons.chat_bubble, 2, 'Trò chuyện'),
            _buildNavItem(Icons.person_outline, Icons.person, 3, 'Hồ sơ'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData unselectedIcon, IconData selectedIcon, int index, String label) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with gradient background for active state
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: isSelected 
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF8B5CF6), // Purple
                          Color(0xFF3B82F6), // Blue  
                          Color(0xFF10B981), // Green
                        ],
                        stops: [0.0, 0.5, 1.0],
                      )
                    : null,
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected 
                    ? [
                        BoxShadow(
                          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                isSelected ? selectedIcon : unselectedIcon,
                size: 24,
                color: isSelected 
                    ? Colors.white
                    : const Color(0xFF9CA3AF), // Gray-400
              ),
            ),
            
            const SizedBox(height: 4),
            
            // Label
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected 
                    ? const Color(0xFF1F2937) // Gray-800
                    : const Color(0xFF9CA3AF), // Gray-400
                letterSpacing: 0.2,
              ),
            ),
            
            // Indicator bar
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(top: 2),
              height: 2,
              width: isSelected ? 20 : 0,
              decoration: BoxDecoration(
                gradient: isSelected 
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF8B5CF6), // Purple
                          Color(0xFF3B82F6), // Blue
                          Color(0xFF10B981), // Green
                        ],
                      )
                    : null,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
