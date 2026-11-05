import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart'; // Import AppColors

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged; 

  const CustomSearchBar({
    super.key, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      onChanged: onChanged, 
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black87,
      ),
      decoration: InputDecoration(
        hintText: 'Cari layanan...',
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.white54 : Colors.grey.shade600,
        ),
        
        
        filled: true,
        fillColor: isDarkMode 
            ? Colors.white.withValues(alpha: 0.05) 
            : Colors.black.withValues(alpha: 0.05),
            
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.white24 : Colors.black12, 
            width: 1,
          ),
        ),
        
        
        suffixIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              
              color: isDarkMode ? AppColors.khaki : AppColors.blueNight,
            ),
            child: Icon(
              Icons.search,
              size: 20,
              
              color: isDarkMode ? AppColors.blueNight : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}