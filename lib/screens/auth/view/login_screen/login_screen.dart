import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/screens/auth/controller/auth_controller.dart';
import 'package:hellobajar/screens/auth/view/login_screen/widget/carousal_widget.dart';
import 'package:hellobajar/widget/text_form_field_widget.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/text_utils.dart';
import '../../../../../widget/button_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextUtils textUtils = TextUtils();
  final ButtonWidget buttonWidget = ButtonWidget();
  final AuthController authController = Get.find();

  final List<String> images = [
    'assets/images/l1.jpg',
    'assets/images/l2.jpg',
    'assets/images/l3.jpg',
    'assets/images/l4.jpg',
    'assets/images/l5.jpg',
    'assets/images/l6.jpg',
    'assets/images/l7.jpg',
    'assets/images/l8.jpg',
    'assets/images/l1.jpg',
    'assets/images/l2.jpg',
    'assets/images/l3.jpg',
    'assets/images/l4.jpg',
  ];

  final _loginFormKey = GlobalKey<FormState>();
  final RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AutoScrollingInfiniteCarousel(images: images, reverse: false),
            SizedBox(height: 2),
            AutoScrollingInfiniteCarousel(images: images, reverse: true),
            SizedBox(height: Get.height * 0.015),

            textUtils.textWidget(
              text: 'Shop Your Daily Needs \n With Hello Bajar',
              textAlign: TextAlign.center,
              color: ColorConstant.darkBrownColor,
              fontSize: 15.0,
            ),
            textUtils.textWidget(
              text: 'Turn Shopping into Easiness',
              color: ColorConstant.darkBrownColor,
              fontSize: 10.0,
            ),
            SizedBox(height: Get.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textUtils.textWidget(
                      text: 'Email Address',
                      color: ColorConstant.darkBrownColor,
                      fontSize: 12,
                    ),
                    SizedBox(height: Get.height * 0.015),
                    TextFormField(
                      cursorColor: ColorConstant.cursorColor,
                      cursorHeight: 20.0,
                      controller: authController.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      decoration: customInputDecoration(
                        hintText: "Enter email",
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    textUtils.textWidget(
                      text: 'Password',
                      color: ColorConstant.darkBrownColor,
                      fontSize: 12,
                    ),

                    SizedBox(height: Get.height * 0.015),
                    Obx(
                      () => TextFormField(
                        cursorColor: ColorConstant.cursorColor,
                        cursorHeight: 20.0,
                        controller: authController.passwordController,
                        obscureText: !isPasswordVisible.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: customInputDecoration(
                          hintText: "Enter Password",
                        ).copyWith(
                          suffixIcon: IconButton(
                            highlightColor: ColorConstant.transparentColor,
                            icon: Icon(
                              isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                              color: ColorConstant.whitegreyColor,
                            ),
                            onPressed: togglePasswordVisibility,
                          ),
                          // onPressed: togglePasswordVisibility,
                        ),
                      ),
                    ),
                    // ),
                    SizedBox(height: Get.height * 0.01),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buttonWidget.textButton(
                          text: 'Forget Password?',
                          textColor: ColorConstant.secondaryColor,
                          fontSize: 11.0,
                          align: TextAlign.right,
                          action: () {
                            // Get.toNamed('/forgetPassword');
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: Get.height * 0.025),
                    // Sign in Button
                    buttonWidget.buttonWidget(
                      borderColor: ColorConstant.secondaryColor,
                      btnColor: ColorConstant.secondaryColor,
                      text: 'Sign In',
                      textColor: ColorConstant.whiteColor,
                      borderRadius: 30.0,
                      actionPerform: () async {
                        if (_loginFormKey.currentState!.validate()) {
                          final email =
                              authController.emailController.text.trim();
                          final password =
                              authController.passwordController.text.trim();

                          //  validation
                          if (email.isEmpty || password.isEmpty) {
                            Get.snackbar('Error', 'Please fill in all fields');
                            return;
                          }

                          if (!GetUtils.isEmail(email)) {
                            Get.snackbar(
                              'Invalid Email',
                              'Please enter a valid email address',
                            );
                            return;
                          }

                          if (password.length < 6) {
                            Get.snackbar(
                              'Weak Password',
                              'Password must be at least 6 characters long',
                            );
                            return;
                          }

                          Get.snackbar(
                            'Success',
                            'Validation passed! Redirecting...',
                          );
                          await Future.delayed(const Duration(seconds: 1));
                          Get.offAllNamed('/bottomNavBar');
                        }
                      },
                    ),
                    // Divider
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.018,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 0.008,
                            ),
                            child: textUtils.textWidget(
                              text: 'or continue with',
                              color: ColorConstant.darkBrownColor,
                              fontSize: 10,
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),

                    // // Phone number button
                    // buttonWidget.buttonWidget(
                    //   borderColor: ColorConstant.darkBrownColor,
                    //   btnColor: ColorConstant.transparentColor,
                    //   text: 'Phone Number',
                    //   textColor: ColorConstant.darkBrownColor,
                    //   borderRadius: 30.0,
                    //   actionPerform: () {
                    //     // Get.toNamed('/phoneNumberPage');
                    //   },
                    // ),
                    // SizedBox(height: Get.height * 0.04),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textUtils.textWidget(
                            text: "Don't have an account?",
                            color: ColorConstant.darkBrownColor,
                            fontSize: 10,
                          ),

                          buttonWidget.textButton(
                            text: ' Register',
                            textColor: ColorConstant.secondaryColor,

                            fontSize: 11.0,
                            align: TextAlign.right,
                            action: () {
                              Get.toNamed('/registerScreen');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
