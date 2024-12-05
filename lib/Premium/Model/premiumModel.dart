import 'package:HT_ONE/Home/Model/home_model.dart';

class PremiumResponse {
  final String sectionName;
  final List<NewsItem> sectionItems;

  PremiumResponse({required this.sectionName, required this.sectionItems});

  factory PremiumResponse.fromJson(Map<String, dynamic> json) {
    return PremiumResponse(
      sectionName: json['sectionName'],
      sectionItems: (json['sectionItems'] as List)
          .map((item) =>  NewsItem.fromJson(item)).toList(),
    );
  }
}