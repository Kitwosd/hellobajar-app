import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hellobajar/constants/api_base_url.dart';
import 'package:hellobajar/screens/auth/model/login_model.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final signupemailController = TextEditingController();
  final signuppasswordController = TextEditingController();

  //FOPRGET PASSWORD CONTROLLER
  final forgotEmailController = TextEditingController();

  final isLoading = false.obs;

  final box = GetStorage();

  ///  REGISTER FUNCTION
  Future<void> registerUser() async {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        signupemailController.text.isEmpty ||
        signuppasswordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        backgroundColor: Colors.red.shade100,
        colorText: ColorConstant.blackColor,
      );
      return;
    }

    isLoading.value = true;

    try {
      final String url = "${ApiBaseUrl.baseUrl}${ApiBaseUrl.registerUrl}";

      final response = await GetConnect().post(
        url,
        {
          "first_name": firstnameController.text.trim(),
          "last_name": lastnameController.text.trim(),
          "email": signupemailController.text.trim(),
          "password": signuppasswordController.text.trim(),
        },
        headers: {"Accept": "application/json"},
      );

      isLoading.value = false;

      debugPrint("🔹 Response Status: ${response.statusCode}");
      debugPrint("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200 && response.body is Map) {
        final body = response.body;

        if (body['success'] == true) {
          Get.snackbar(
            "Success",
            body['message'] ??
                "User registered successfully. Please verify OTP sent to your email.",
            backgroundColor: Colors.green.shade100,
            colorText: Colors.black,
            snackPosition: SnackPosition.BOTTOM,
          );

          Get.toNamed('/loginScreen');
        } else {
          Get.snackbar(
            "Failed",
            body['message'] ?? "Registration failed",
            backgroundColor: Colors.red.shade100,
            colorText: Colors.black,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Unexpected response from server.",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      debugPrint(" Registration Error: $e");
    }
  }

  //LOGIN FUNCTION

  Future<void> loginUser(String email, String password) async {
    final box = GetStorage();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password are required",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    try {
      final url = Uri.parse("${ApiBaseUrl.baseUrl}${ApiBaseUrl.loginUrl}");
      debugPrint("🔹 Sending POST to: $url");
      debugPrint("🔹 Email: $email");

      final response = await http
          .post(
            url,
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
            },
            body: jsonEncode({"email": email, "password": password}),
          )
          .timeout(const Duration(seconds: 15));

      debugPrint("🔹 Response status: ${response.statusCode}");
      debugPrint("🔹 Response raw: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(body);

        if (loginResponse.success) {
          // Save tokens & user
          await box.write('accessToken', loginResponse.access);
          await box.write('refreshToken', loginResponse.refresh);
          await box.write('user', loginResponse.user.toJson());

          debugPrint("✅ Login successful! Navigating to BottomNavBar");
          Get.offAllNamed('/bottomNavBar');
        } else {
          Get.snackbar(
            "Login Failed",
            "Invalid credentials",
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
      debugPrint("❌ Login Error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    }
  }

  /// FORGOT PASSWORD FUNCTION
  Future<void> sendForgotPasswordOtp() async {
    final email = forgotEmailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        "Error",
        "Email is required",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse(
        "${ApiBaseUrl.baseUrl}${ApiBaseUrl.forgetPasswordUrl}",
      );
      debugPrint(" Sending Forgot Password POST to: $url");
      debugPrint(" Email: $email");

      final response = await http
          .post(
            url,
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
            },
            body: jsonEncode({"email": email}),
          )
          .timeout(Duration(seconds: 15));

      isLoading.value = false;

      debugPrint(" Response status: ${response.statusCode}");
      debugPrint(" Response raw: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['success'] == true) {
          // Show success snackbar
          Get.snackbar(
            "OTP Sent",
            body['message'] ?? "OTP sent to your email.",
            backgroundColor: Colors.green.shade100,
            colorText: Colors.black,
          );

          // Navigate to OTP screen and pass the email
          Get.toNamed('/OTPScreen', arguments: {"email": email});
        } else {
          Get.snackbar(
            "Failed",
            body['message'] ?? "Failed to send OTP",
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
      isLoading.value = false;
      debugPrint(" Forgot Password Error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    }
  }

  /// VERIFY FORGOT PASSWORD OTP
  Future<void> verifyForgotPasswordOtp(String email, String otpCode) async {
    if (otpCode.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter the OTP code",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse("${ApiBaseUrl.baseUrl}${ApiBaseUrl.verifyOPT}");
      debugPrint(" Sending POST to: $url");
      debugPrint(" Email: $email");
      debugPrint(" OTP Code: $otpCode");

      final response = await http
          .post(
            url,
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
            },
            body: jsonEncode({"email": email, "otp_code": otpCode}),
          )
          .timeout(const Duration(seconds: 15));

      isLoading.value = false;

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['success'] == true) {
          final accessToken = body['access'];

          // Save access token for later use (reset password)
          await box.write('resetAccessToken', accessToken);

          Get.snackbar(
            "Success",
            body['message'] ?? "OTP verified successfully.",
            backgroundColor: Colors.green.shade100,
            colorText: Colors.black,
          );

          Get.toNamed('/resetPasswordScreen', arguments: {"email": email});
        } else {
          Get.snackbar(
            "Failed",
            body['message'] ?? "Invalid OTP. Please try again.",
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
      isLoading.value = false;
      debugPrint(" OTP Verification Error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    }
  }

  /// LOGOUT FUNCTION

  Future<void> logout() async {
    await box.erase();
    Get.offAllNamed('/loginScreen');
  }
}
