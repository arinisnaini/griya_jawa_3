import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 
import '../../core/theme/app_colors.dart';
import '../../core/painters/wave_painter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressController.forward().then((_) {
      if (mounted) {
        context.go('/dashboard'); 
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color creamBackground = Color(0xFFF9F6F0);

    return Scaffold(
      backgroundColor: creamBackground,
      body: Stack(
        children: [
          // --- LAYER 1: LOGO ATAS ---
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.10,
              child: Image.asset(
                'assets/images/logo-pkp.png', 
                width: 250,
                errorBuilder: (c, e, s) => const SizedBox(), 
              ),
            ),
          ),

          // --- LAYER 2: LOGO TENGAH KIRI ---
          Positioned(
            top: 180,
            left: -80,
            child: Opacity(
              opacity: 0.10,
              child: Image.asset(
                'assets/images/logo-pkp.png', 
                width: 300,
                errorBuilder: (c, e, s) => const SizedBox(),
              ),
            ),
          ),

          // --- LAYER 3: LOGO BAWAH KANAN ---
          Positioned(
            bottom: 80,
            right: -80,
            child: Opacity(
              opacity: 0.10,
              child: Image.asset(
                'assets/images/logo-pkp.png', 
                width: 300,
                errorBuilder: (c, e, s) => const SizedBox(),
              ),
            ),
          ),

          // --- LAYER 4: GELOMBANG BAWAH ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: CustomPaint(
              painter: WavePainter(
                blueNight: AppColors.blueNight,
                khaki: AppColors.khaki,
              ),
            ),
          ),

          // --- LAYER 5: KONTEN TENGAH ---
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo-pkp.png', 
                  width: 100,
                  errorBuilder: (c, e, s) => const SizedBox(),
                ),
                const SizedBox(height: 24),

                Image.asset(
                  'assets/images/GRIYA_JAWA3.png',
                  width: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (c, e, s) => const SizedBox(),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AnimatedBuilder(
                      animation: _progressController,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: _progressController.value,
                          minHeight: 4,
                          backgroundColor:
                              AppColors.khaki.withValues(alpha: 0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.blueNight),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

