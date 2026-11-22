import 'package:flutter/material.dart';

class AppColors {
  // WARNA UTAMA 
  static const Color blueNight = Color(0xFF0F172A);      
  static const Color blueNightLight = Color(0xFF1E293B); 
  static const Color khaki = Color(0xFFC3B091);          
  static const Color khakiSoft = Color(0xFFF9F5EC);      
  // TEMA TERANG (LIGHT MODE)
  static const Color lightBg = Color(0xFFF8F9FA);         
  static const Color lightCardSurface = Colors.white;   
  static const Color gridLightBg = Color(0xFFF1F5F9); 
  static const Color lightPlaceholder = Color(0xFFE2E8F0); 
  static const Color lightBorder = Color(0xFFE2E8F0);      
  static const Color lightTextPrimary = blueNight;         
  static const Color lightTextSecondary = Color(0xFF64748B);

  // TEMA GELAP (DARK MODE)
  static const Color darkBg = blueNight;                   
  static const Color darkNavbar = blueNightLight;      
  static const Color darkCardSurface = blueNightLight;     
  static const Color gridDarkBg = Color(0xFF283548);       
  static const Color darkPlaceholder = Color(0xFF283548);  
  static const Color darkBorder = Color(0xFF334155);       
  static const Color darkTextPrimary = Colors.white;       
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // AKSEN & STATUS
  static const Color goldAccent = Color(0xFFEAB308);       
  static const Color primaryTeal = Color(0xFF0D9488);      
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

   
  static const Color icon = khakiSoft;
  static const Color text = Colors.white;
  static const Color textMotto = Colors.white70;
  static const Color darkUnselected = darkTextSecondary;
  static const Color lightUnselected = lightTextSecondary;
}