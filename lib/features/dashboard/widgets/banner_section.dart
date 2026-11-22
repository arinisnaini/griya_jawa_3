import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../providers/dashboard_providers.dart';

class BannerSection extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const BannerSection({
    super.key,
    required this.isDarkMode,
  });

  @override
  ConsumerState<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends ConsumerState<BannerSection> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  static const double _bannerAspectRatio = 2.65 / 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bannerAsync = ref.watch(bannerProvider);

    final titleColor = widget.isDarkMode
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;

    final activeDotColor =
        widget.isDarkMode ? AppColors.khaki : AppColors.blueNight;

    final placeholderColor = widget.isDarkMode
        ? AppColors.darkPlaceholder
        : AppColors.lightPlaceholder;

    final iconSecondaryColor = widget.isDarkMode
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return bannerAsync.when(
      loading: () => AspectRatio(
        aspectRatio: _bannerAspectRatio,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: placeholderColor,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      error: (err, stack) => const SizedBox.shrink(),
      data: (banners) {
        if (banners.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER SECTION + DOT INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Program & Informasi',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ),
                if (banners.length > 1)
                  Row(
                    children: List.generate(
                      banners.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(left: 5),
                        height: 6,
                        width: _currentIndex == index ? 18 : 6,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? activeDotColor
                              : activeDotColor.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 14),

            // BANNER SLIDER
            AspectRatio(
              aspectRatio: _bannerAspectRatio,
              child: PageView.builder(
                controller: _pageController,
                itemCount: banners.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final banner = banners[index];

                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == banners.length - 1 ? 0 : 8,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          banner.imageUrl,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: placeholderColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: placeholderColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: iconSecondaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ], 
        );
      },
    );
  }
}