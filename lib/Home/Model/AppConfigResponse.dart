import 'dart:convert';

// Main Model
class AppConfigResponse {
  Config config;
  Subscription subscription;
  List<BottomNavSection> bottomNavSections;

  AppConfigResponse({
    required this.config,
    required this.subscription,
    required this.bottomNavSections,
  });

  factory AppConfigResponse.fromJson(Map<String, dynamic> json) {
    return AppConfigResponse(
      config: Config.fromJson(json['config']),
      subscription: Subscription.fromJson(json['subscription']),
      bottomNavSections: ((json['bottomNavSection']?? [])as List)
          .map((e) => BottomNavSection.fromJson(e))
          .toList(),
    );
  }
}

// Config (Empty for now, placeholder for future fields)
class Config {
  Config();

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config();
  }
}

// Subscription (Empty for now, placeholder for future fields)
class Subscription {
  Subscription();

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription();
  }
}

// Bottom Navigation Section
class BottomNavSection {
  String id;
  String? feedUrl;
  String iconType;
  String? template;
  List<Section>? sections;
  bool? isPremium;
  String sectionUrl;
  String displayName;
  String sectionName;
  bool? isWebStoriesSection;
  bool?  isHomeTab;

  BottomNavSection({
    required this.id,
    this.feedUrl,
    required this.iconType,
    this.template,
    required this.sections,
    this.isPremium,
    required this.sectionUrl,
    required this.displayName,
    required this.sectionName,
    required this.isWebStoriesSection,
    required this.isHomeTab,
  });

  factory BottomNavSection.fromJson(Map<String, dynamic> json) {
    return BottomNavSection(
      id: json['id'],
      feedUrl: json['feedUrl'],
      iconType: json['iconType'],
      template: json['template'],
      sections: ((json['sections']?? []) as List)
          .map((e) => Section.fromJson(e))
          .toList(),
      isPremium: json['isPremium'],
      sectionUrl: json['sectionUrl'],
      displayName: json['displayName'],
      sectionName: json['sectionName'],
      isWebStoriesSection: json['isWebStoriesSection'],
      isHomeTab: json['isHomeTab'],
    );
  }
}

// Section
class Section {
  String feedURL;
  String template;
  String sectionID;
  String sectionUrl;
  String displayName;
  String sectionName;
  bool? isWebBasedSection;
  bool? isSectionPhotoVideo;
  bool? isHome;
  String? displayNameEnglish;

  Section({
    required this.feedURL,
    required this.template,
    required this.sectionID,
    required this.sectionUrl,
    required this.displayName,
    required this.sectionName,
    this.isWebBasedSection,
     this.isSectionPhotoVideo,
    this.isHome,
    this.displayNameEnglish,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      feedURL: json['feedURL'],
      template: json['template'],
      sectionID: json['sectionID'],
      sectionUrl: json['sectionUrl'],
      displayName: json['displayName'],
      sectionName: json['sectionName'],
      isWebBasedSection: json['isWebBasedSection'],
      isSectionPhotoVideo: json['isSectionPhotoVideo'],
      isHome: json['isHome'],
      displayNameEnglish: json['displayNameEnglish'],
    );
  }
}
