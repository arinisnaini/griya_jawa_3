import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/config/api_config.dart';
import 'dashboard_models.dart';

class BannerService {
   
  String get _endpoint =>
      '${ApiConfig.baseUrl}/public/sites/${ApiConfig.siteSlug}';

  Future<List<BannerModel>> fetchBanners() async {
    final response = await http.get(
      Uri.parse(_endpoint),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat banner (${response.statusCode})');
    }

    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;

    final List<dynamic> bannerList =
        (decoded['site'] as Map<String, dynamic>?)?['banners']
            as List<dynamic>? ??
        [];

    return bannerList
        .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}