class BannerModel {
  final String id;
  final String imageUrl;
  final String title;

  BannerModel({required this.id, required this.imageUrl, required this.title});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'].toString(),
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
    );
  }
}

class VideoModel {
  final String id;
  final String title;
  final String thumbnailUrl;

  VideoModel({required this.id, required this.title, required this.thumbnailUrl});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
    );
  }
}

class InformationModel {
  final String id;
  final String title;
  final String date;

  InformationModel({required this.id, required this.title, required this.date});

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      date: json['created_at'] ?? '',
    );
  }
}