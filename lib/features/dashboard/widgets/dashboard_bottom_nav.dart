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
    final activePillColor = isDarkMode ? AppColors.khaki : AppColors.blueNight;
    final activeContentColor = isDarkMode ? AppColors.blueNight : Colors.white;
    final inactiveColor = isDarkMode
        ? AppColors.khaki.withValues(alpha: 0.5)
        : AppColors.blueNight.withValues(alpha: 0.45);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isDarkMode
                  ? Colors.white.withValues(alpha: 0.08)
                  : AppColors.blueNight.withValues(alpha: 0.06),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDarkMode ? 0.35 : 0.10),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ITEM 1: NOTIFIKASI (Index 1)
              _buildNavItem(
                index: 1,
                icon: Icons.notifications_rounded,
                label: 'Notifikasi',
                isActive: selectedIndex == 1,
                activePillColor: activePillColor,
                activeContentColor: activeContentColor,
                inactiveColor: inactiveColor,
              ),

              // ITEM 2: BERANDA (Index 0) - Default
              _buildNavItem(
                index: 0,
                icon: Icons.home_rounded,
                label: 'Beranda',
                isActive: selectedIndex == 0,
                activePillColor: activePillColor,
                activeContentColor: activeContentColor,
                inactiveColor: inactiveColor,
              ),

              // ITEM 3: PROFILE (Index 2)
              _buildNavItem(
                index: 2,
                icon: Icons.person_rounded,
                label: 'Profile',
                isActive: selectedIndex == 2,
                activePillColor: activePillColor,
                activeContentColor: activeContentColor,
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
    required Color activePillColor,
    required Color activeContentColor,
    required Color inactiveColor,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onPortalSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 20 : 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isActive ? activePillColor : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isActive ? activeContentColor : inactiveColor,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              child: isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: activeContentColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}