import 'dart:convert';
import 'package:HT_ONE/Home/Model/premium_model.dart';
import 'package:http/http.dart' as http;

class PremiumApiService {
  static const String baseUrl = "https://api.hindustantimes.com/api/app/homenew/sectionfeed/v2/premium";

  Future<PremiumResponse?> fetchPremiumData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['content'];
        return PremiumResponse.fromJson(data);
      } else {
        print("Failed to load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}