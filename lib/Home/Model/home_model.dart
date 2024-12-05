// class NewsItem {
//   final String title;
//   final String description;
//   final String imageUrl;
//
//   NewsItem({
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//   });
// }
import 'dart:ffi';

class HomeResponse {
  final String sectionName;
  final List<SectionItem> sectionItems;

  HomeResponse({required this.sectionName, required this.sectionItems});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      sectionName: json['sectionName'],
      sectionItems: (json['sectionItems'] as List)
          .map((item) => SectionItem.fromJson(item))
          .toList(),
    );
  }
}

class SectionItem {
  final String blockName;
  final List<NewsItem> newsItems;

  SectionItem({required this.blockName, required this.newsItems});

  factory SectionItem.fromJson(Map<String, dynamic> json) {
    return SectionItem(
      blockName: json['blockName'],
      newsItems: (json['blockItems'] as List)
          .map((item) => NewsItem.fromJson(item))
          .toList(),
    );
  }
}

class NewsItem {
  final String headline;
  final String shortDescription;
  final String publishedDate;
  final String thumbImage;
  final String wallpaperLarge;
  final String section;
  final int timeToRead;
  NewsItem({
    required this.headline,
    required this.shortDescription,
    required this.publishedDate,
    required this.thumbImage,
    required this.wallpaperLarge,
    required this.section,
    required this.timeToRead,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      headline: json['headLine'],
      shortDescription: json['shortDescription'],
      publishedDate: json['publishedDate'],
      thumbImage: json['thumbImage'],
      wallpaperLarge: json['wallpaperLarge'],
      section: json['section'],
      timeToRead: json['timeToRead'] as int ?? 0,
    );
  }
}
