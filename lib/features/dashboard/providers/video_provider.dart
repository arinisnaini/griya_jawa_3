import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dashboard_repository.dart';
import '../data/dashboard_models.dart';

export 'dashboard_providers.dart';

final videoRepositoryProvider = Provider((ref) => DashboardRepository());

final latestVideosProvider = FutureProvider<List<VideoModel>>((ref) async {
  return await ref.read(videoRepositoryProvider).getLatestVideos();
});