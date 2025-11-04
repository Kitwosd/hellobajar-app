import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  //TextField Signin Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //TextField Register Controller
  final fullnameController = TextEditingController();
  final signupemailController = TextEditingController();
  final signuppasswordController = TextEditingController();
}
