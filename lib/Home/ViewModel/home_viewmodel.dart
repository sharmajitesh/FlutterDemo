import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/home_model.dart';

class ApiService {
  //static const String baseUrl = "https://api.hindustantimes.com/api/app/v5/home?version=v2&size=30";

  Future<HomeResponse?> fetchHomeData(String feedUrl) async {
    try {
      final response = await http.get(Uri.parse(feedUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['content'];
        return HomeResponse.fromJson(data);
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
