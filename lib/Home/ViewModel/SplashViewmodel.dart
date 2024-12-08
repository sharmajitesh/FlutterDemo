import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;

import '../Model/AppConfigResponse.dart';

class SplashViewmodel {
  static const String baseUrl = "https://api.npoint.io/9ae243716aacf2dcc2ae";

  Future<AppConfigResponse?> fetchAppData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      //log('Manoj::data: $response');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        //log('Manoj::data:data: $data');
        final parseResponse= AppConfigResponse.fromJson(data);
        log('Manoj::data:parseResponse: $parseResponse');
        return parseResponse;
      } else {
        print("Failed to load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Manoj Error : $e");
      return null;
    }
  }
}