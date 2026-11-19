import 'package:flutter/material.dart';

class ModuleItem {
  final String title;
  final String? imagePath; 
  final IconData? icon;    
  final String? route;     

  const ModuleItem({
    required this.title,
    this.imagePath,
    this.icon,
    this.route,
  });
}

// --- DAFTAR PUSAT MODUL ---
const List<ModuleItem> appModules = [
  ModuleItem(
    title: "Sejati",
    imagePath: "assets/icons/Sejati.png",
  ),
  ModuleItem(
    title: "Aksi Jati",
    imagePath: "assets/icons/Aksi-jati.png",
  ),
  ModuleItem(
    title: "Warung Jati",
    imagePath: "assets/icons/Warung-jati.png",
    route: "/warung-jati",
  ),
  ModuleItem(
    title: "Kang Jati",
    imagePath: "assets/icons/Kang-jati.png",
    route: "/kang-jati",
  ),
  ModuleItem(
    title: "Bank Design",
    imagePath: "assets/icons/Bank-design.png",
  ),
  ModuleItem(
    title: "Semua",
    icon: Icons.grid_view_rounded,
  ),
];