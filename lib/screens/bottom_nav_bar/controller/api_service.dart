import 'dart:convert';
import 'package:get/get.dart';
import 'package:hellobajar/constants/api_base_url.dart';
import 'package:hellobajar/screens/bottom_nav_bar/model/home_screen_model.dart';

class ApiService extends GetConnect {
  Future<HomeResponse?> fetchHomeData() async {
    try {
      final response = await get(
        "${ApiBaseUrl.baseUrl}${ApiBaseUrl.homeScreenApi}",
      );

      if (response.statusCode == 200) {
        return HomeResponse.fromJson(response.body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching home data: $e");
      return null;
    }
  }
}
