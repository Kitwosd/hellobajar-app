import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hellobajar/constants/api_base_url.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/model/my_profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;

  // Store profile data as Map
  var profile = <String, dynamic>{
    "first_name": "",
    "last_name": "",
    "email": "",
    "phone": "",
    "gender": "",
    "address": "",
    "city": "",
  }.obs;

  // Fetch profile from API
  Future<void> fetchProfile() async {
    isLoading.value = true;

    try {
      final accessToken = box.read('accessToken') ?? '';
      if (accessToken.isEmpty) {
        Get.snackbar("Error", "Access token missing. Please login again.",
            backgroundColor: Colors.red.shade100, colorText: Colors.black);
        isLoading.value = false;
        return;
      }

      final url = Uri.parse("${ApiBaseUrl.baseUrl}/api/customer-profile/");

      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final profileModel = MyProfileModel.fromJson(data);

        if (profileModel.success == true && profileModel.profile != null) {
          profile.value = {
            "first_name": profileModel.profile?.firstName ?? "",
            "last_name": profileModel.profile?.lastName ?? "",
            "email": profileModel.profile?.email ?? "",
            "phone": profileModel.profile?.phone ?? "",
            "gender": profileModel.profile?.gender ?? "",
            "address": profileModel.profile?.address ?? "",
            "city": profileModel.profile?.city ?? "",
          };

          // Save locally
          await box.write('user', profile.value);
        } else {
          Get.snackbar(
            "Error",
            "Failed to load profile",
            backgroundColor: Colors.red.shade100,
            colorText: Colors.black,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Server error: ${response.statusCode}",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong: $e",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Update profile API
  Future<void> updateProfile() async {
    isLoading.value = true;

    try {
      final accessToken = box.read('accessToken') ?? '';
      final url = Uri.parse("${ApiBaseUrl.baseUrl}${ApiBaseUrl.editProfileApi}");

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(profile.value),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        Get.snackbar(
          "Success",
          data['message'] ?? "Profile updated successfully.",
          backgroundColor: Colors.green.shade100,
          colorText: Colors.black,
        );

        // Save updated profile locally
        await box.write('user', profile.value);
      } else {
        Get.snackbar(
          "Error",
          data['message'] ?? "Failed to update profile.",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong: $e",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Load profile from local storage
  void loadProfile() {
    final storedUser = box.read('user') ?? {};
    profile.value = {
      "first_name": storedUser['first_name'] ?? "",
      "last_name": storedUser['last_name'] ?? "",
      "email": storedUser['email'] ?? "",
      "phone": storedUser['phone']?.toString() ?? "",
      "gender": storedUser['gender'] ?? "",
      "address": storedUser['address'] ?? "",
      "city": storedUser['city'] ?? "",
    };
  }
}
