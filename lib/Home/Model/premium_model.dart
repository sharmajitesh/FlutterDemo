class PremiumResponse{
  final String sectionName;
  final String sectionUrl;
  final List<PremiumItem> premiumItems;

  PremiumResponse({required this.sectionName, required this.sectionUrl, required this.premiumItems});

  factory PremiumResponse.fromJson(Map<String, dynamic> json) {
    return PremiumResponse(
      sectionName: json['sectionName'],
      sectionUrl: json['sectionUrl'],
      premiumItems: (json['sectionItems'] as List)
          .map((item) => PremiumItem.fromJson(item))
          .toList(),
    );
  }

}

class PremiumItem {
  final String contentType;
  final String mobileHeadline;
  final String section;
  final int timeToRead;
  final String thumbImage;
  final String wallpaperLarge;
  final bool exclusiveStory;


  PremiumItem({required this.contentType, required this.mobileHeadline, required this.section, required this.timeToRead, required this.thumbImage, required this.wallpaperLarge, required this.exclusiveStory});

  factory PremiumItem.fromJson(Map<String, dynamic> json) {
    return PremiumItem(
        contentType: json['contentType'],
        mobileHeadline: json['mobileHeadline'],
        section: json['section'],
        timeToRead: json['timeToRead'],
        thumbImage: json['thumbImage'],
        wallpaperLarge: json['wallpaperLarge'],
        exclusiveStory: json['exclusiveStory']
    );
  }
}