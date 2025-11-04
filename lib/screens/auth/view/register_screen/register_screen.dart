import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/routes/app_routes.dart';
import 'package:hellobajar/screens/auth/controller/auth_controller.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/button_widgets.dart';
import 'package:hellobajar/widget/text_form_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController();
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.03,
          vertical: Get.height * 0.08,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // textUtils.textWidget(text: 'Register your account'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Hello_bajar_Logo_png.png',
                    height: Get.height * 0.12,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              // Full Name
              TextFormField(
                controller: authController.fullnameController,
                decoration: customInputDecoration(hintText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.02),

              // Email
              TextFormField(
                controller: authController.signupemailController,
                decoration: customInputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.02),

              // Password
              TextFormField(
                controller: authController.signuppasswordController,
                decoration: customInputDecoration(
                  hintText: 'Password',
                  isPasswordField: true,
                  isPasswordVisible: !_obscurePassword,
                  suffixOnPress: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.02),

              // Confirm Password
              TextFormField(
                controller: authController.signuppasswordController,
                decoration: customInputDecoration(
                  hintText: 'Confirm Password',
                  isPasswordField: true,
                  isPasswordVisible: !_obscureConfirmPassword,
                  suffixOnPress: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                obscureText: _obscureConfirmPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != authController.signuppasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.035),

              // Sign Up Button
              buttonWidget.buttonWidget(
                borderColor: ColorConstant.secondaryColor,
                btnColor: ColorConstant.secondaryColor,
                text: 'Sign Up',
                textColor: ColorConstant.whiteColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,

                borderRadius: 30.0,
                actionPerform: () async {
                  if (_formKey.currentState!.validate()) {
                    // Call your signup logic here
                    Get.snackbar(
                      'Success',
                      'Account registered successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
              ),

              SizedBox(height: Get.height * 0.025),

              // OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: Get.height * 0.025),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: ColorConstant.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
