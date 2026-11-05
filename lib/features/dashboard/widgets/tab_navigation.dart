import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart'; // Import AppColors

class TabNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final bool isDarkMode;

  const TabNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTabItem(title: 'Layanan', index: 0),
        const SizedBox(width: 8),
        _buildTabItem(title: 'Informasi', index: 1),
      ],
    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    final isSelected = selectedIndex == index;
    
    
    final backgroundColor = isSelected
        ? (isDarkMode ? AppColors.khaki : AppColors.blueNight)
        : Colors.transparent;
        
    final textColor = isSelected
        ? (isDarkMode ? AppColors.blueNight : Colors.white) 
        : (isDarkMode ? Colors.white70 : AppColors.blueNight); 

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}