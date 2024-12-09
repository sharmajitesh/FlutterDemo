import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;

import '../Model/AppConfigResponse.dart';

class SplashViewmodel {
  static const String baseUrl = "https://api.npoint.io/f2963d3289b81d67a7e6";

  Future<AppConfigResponse?> fetchAppData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final parseResponse= AppConfigResponse.fromJson(data);
        return parseResponse;
      } else {
        print("Failed to load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }
}