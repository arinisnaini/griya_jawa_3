import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dashboard_models.dart';

class DashboardRepository {
  
  SupabaseClient? get _supabase {
    try {
      return Supabase.instance.client;
    } catch (e) {
      
      return null; 
    }
  }

  Future<List<BannerModel>> getBanners() async {
    try {
      if (_supabase == null) return []; 
      
      final response = await _supabase!
          .from('banners')
          .select()
          .eq('is_active', true);
          
      return response.map((e) => BannerModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Gagal memuat banner: $e');
      return []; 
    }
  }

  Future<List<VideoModel>> getLatestVideos() async {
    try {
      if (_supabase == null) return [];
      
      final response = await _supabase!
          .from('videos')
          .select()
          .order('created_at', ascending: false)
          .limit(5);
          
      return response.map((e) => VideoModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Gagal memuat video: $e');
      return []; 
    }
  }

  Future<List<InformationModel>> getInformations() async {
    try {
      if (_supabase == null) return [];
      
      final response = await _supabase!
          .from('informations')
          .select()
          .order('created_at', ascending: false);
          
      return response.map((e) => InformationModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Gagal memuat informasi: $e');
      return []; 
    }
  }
}