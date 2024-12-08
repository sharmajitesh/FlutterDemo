import 'dart:convert';
import 'package:HT_ONE/Home/Model/SectionResponse.dart';
import 'package:http/http.dart' as http;
import '../Model/home_model.dart';

class SectionItemViewModel {
  //static const String baseUrl = "https://api.hindustantimes.com/api/app/v5/home?version=v2&size=30";

  Future<SectionResponse?> getSectionData(String feedUrl) async {
    try {
      final response = await http.get(Uri.parse(feedUrl));

      if (response.statusCode == 200) {
       // print("Manoj to section:::+$feedUrl::::${response.body}");
        SectionResponse sectionResponse= SectionResponse.parseJson(response.body);
      //  print("Manoj to section:::+$feedUrl::::${sectionResponse.content.sectionItems?.length}");
        return sectionResponse;
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
