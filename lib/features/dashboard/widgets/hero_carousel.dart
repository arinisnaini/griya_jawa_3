import 'package:flutter/material.dart';
import '../data/dashboard_models.dart';

class HeroCarousel extends StatelessWidget {
  final PageController pageController;
  final List<HeroModel> heroes;
  final Function(int) onPageChanged;
  final bool isDarkMode;

  const HeroCarousel({
    super.key,
    required this.pageController,
    required this.heroes,
    required this.onPageChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    if (heroes.isEmpty) {
      return Container(
        width: double.infinity,
        height: 200,
        color: isDarkMode ? const Color(0xFF1E293B) : Colors.grey[300],
        child: Center(
          child: Text(
            'Banner belum tersedia',
            style: TextStyle(
              color: isDarkMode ? Colors.white54 : Colors.black54,
            ),
          ),
        ),
      );
    }

    
    return AspectRatio(
      aspectRatio: 16 / 9, 
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                heroes[index].imageUrl,
                fit: BoxFit.cover, 
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image_outlined, size: 40),
                  );
                },
              ),

              
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.0, 0.5, 1.0],
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}