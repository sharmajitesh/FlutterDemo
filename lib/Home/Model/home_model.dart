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
  final CollectionType collectionType;

  SectionItem({required this.blockName, required this.newsItems, required this.collectionType});

  factory SectionItem.fromJson(Map<String, dynamic> json) {
    return SectionItem(
      blockName: json['blockName'],
      newsItems: (json['blockItems'] as List)
          .map((item) => NewsItem.fromJson(item))
          .toList(),
        collectionType: collectionTypeFromString(json['collectionType'])
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
      timeToRead: json['timeToRead'] as int ?? 0
    );
  }
}

enum CollectionType {
  defaultType,
  pickOfTheDay,
  infographics,
  premium,
  numberTheory
}

CollectionType collectionTypeFromString(String collectionType) {
  switch (collectionType) {
    case 'default':
      return CollectionType.defaultType;
    case 'collection_pickOfTheDay':
      return CollectionType.pickOfTheDay;
    case 'collection_infographics':
      return CollectionType.infographics;
    case 'collection_home_premium':
      return CollectionType.premium;
    case 'collection_number_theory':
      return CollectionType.numberTheory;
    default:
      return CollectionType.defaultType;
      throw ArgumentError('Unknown collection type: $collectionType');
  }
}