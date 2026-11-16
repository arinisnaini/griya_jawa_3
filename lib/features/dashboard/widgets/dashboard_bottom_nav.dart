import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DashboardBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onPortalSelected;
  final bool isDarkMode;

  const DashboardBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onPortalSelected,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? AppColors.darkNavbar : Colors.white; 
    final activeColor = isDarkMode ? AppColors.khaki : AppColors.blueNight;
  
    final inactiveColor = isDarkMode 
        ? AppColors.khaki.withValues(alpha: 0.4) 
        : AppColors.blueNight.withValues(alpha: 0.4);

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.08),
            blurRadius: 10,
            offset: const Offset(0, -2), 
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ITEM 1: NOTIFIKASI (Index 1)
              _buildNavItem(
                index: 1,
                icon: Icons.notifications,
                label: 'Notifikasi',
                isActive: selectedIndex == 1,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              ),

              // ITEM 2: BERANDA (Index 0) - Default 
              _buildNavItem(
                index: 0,
                icon: Icons.home_filled,
                label: 'Beranda',
                isActive: selectedIndex == 0,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              ),

              // ITEM 3: PROFILE (Index 2)
              _buildNavItem(
                index: 2,
                icon: Icons.person,
                label: 'Profile',
                isActive: selectedIndex == 2,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isActive,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onPortalSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isActive ? activeColor : inactiveColor,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive ? activeColor : inactiveColor,
            ),
          ),
          const SizedBox(height: 6),
          // Indikator Garis Bawah
          Container(
            width: 24,
            height: 3,
            decoration: BoxDecoration(
              color: isActive ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}