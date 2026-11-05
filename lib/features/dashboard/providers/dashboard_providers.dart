import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dashboard_repository.dart';
import '../data/dashboard_models.dart';

/// Provider for DashboardRepository instance
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

/// Provider for banners in the dashboard hero carousel
final bannerProvider = FutureProvider<List<BannerModel>>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.getBanners();
});

/// Provider for latest videos in the dashboard content section
final videoProvider = FutureProvider<List<VideoModel>>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.getLatestVideos();
});

/// Provider for announcement/information in the dashboard
final informationProvider = FutureProvider<List<InformationModel>>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.getInformations();
});
