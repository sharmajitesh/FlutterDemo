import 'dart:convert';



// Model for Root Object
class SectionResponse {
  final Content content;

  SectionResponse({required this.content});

  // Factory constructor to create RootObject from JSON
  static _fromJson(Map<String, dynamic> json) {
    return SectionResponse(
      content: Content.fromJson(json['content']),
    );
  }
  factory SectionResponse.parseJson(String jsonString) {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return SectionResponse._fromJson(jsonData);
  }
}

// Function to parse JSON string into RootObject


// Model for SectionItem
class SectionItem {
  final String itemId;
  final String contentType;
  final String headLine;
  final String shortDescription;
  final String publishedDate;
  final String thumbImage;
  final String mediumRes;
  final String detailFeedURL;
  final String wallpaperLarge;
  final String agencyName;
  final String websiteURL;
  final String keywords;
  final bool exclusiveStory;
  final String section;
  final String subSection;
  final int timeToRead;
  final String audioSourceURL;
  final String externalURL;
  final String mobileHeadline;

  SectionItem({
    required this.itemId,
    required this.contentType,
    required this.headLine,
    required this.shortDescription,
    required this.publishedDate,
    required this.thumbImage,
    required this.mediumRes,
    required this.detailFeedURL,
    required this.wallpaperLarge,
    required this.agencyName,
    required this.websiteURL,
    required this.keywords,
    required this.exclusiveStory,
    required this.section,
    required this.subSection,
    required this.timeToRead,
    required this.audioSourceURL,
    required this.externalURL,
    required this.mobileHeadline,
  });

  // Factory constructor to create a SectionItem from JSON
  factory SectionItem.fromJson(Map<String, dynamic> json) {
    return SectionItem(
      itemId: json['itemId'] ?? '',
      contentType: json['contentType'] ?? '',
      headLine: json['headLine'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      publishedDate: json['publishedDate'] ?? '',
      thumbImage: json['thumbImage'] ?? '',
      mediumRes: json['mediumRes'] ?? '',
      detailFeedURL: json['detailFeedURL'] ?? '',
      wallpaperLarge: json['wallpaperLarge'] ?? '',
      agencyName: json['agencyName'] ?? '',
      websiteURL: json['websiteURL'] ?? '',
      keywords: json['keywords'] ?? '',
      exclusiveStory: json['exclusiveStory'] ?? false,
      section: json['section'] ?? '',
      subSection: json['subSection'] ?? '',
      timeToRead: json['timeToRead'] ?? 0,
      audioSourceURL: json['audioSourceURL'] ?? '',
      externalURL: json['externalURL'] ?? '',
      mobileHeadline: json['mobileHeadline'] ?? '',
    );
  }
}

// Model for Content
class Content {
  final String sectionName;
  final String sectionUrl;
  final List<SectionItem>? sectionItems;

  Content({
    required this.sectionName,
    required this.sectionUrl,
    required this.sectionItems,
  });

  // Factory constructor to create Content from JSON
  factory Content.fromJson(Map<String, dynamic> json) {
    var sectionItemsJson = json['sectionItems'] as List;
    List<SectionItem> sectionItems = sectionItemsJson.map((item) => SectionItem.fromJson(item)).toList();

    return Content(
      sectionName: json['sectionName'] ?? '',
      sectionUrl: json['sectionUrl'] ?? '',
      sectionItems: sectionItems,
    );
  }
}
