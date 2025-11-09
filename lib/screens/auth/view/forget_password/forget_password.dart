import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/screens/auth/controller/auth_controller.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/button_widgets.dart';
import 'package:hellobajar/widget/text_form_field_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextUtils textUtils = TextUtils();
  final ButtonWidget buttonWidget = ButtonWidget();
  final AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              textUtils.textWidget(
                text: "Forgot Password?",
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: ColorConstant.darkBrownColor,
              ),
              SizedBox(height: Get.height * 0.015),
              textUtils.textWidget(
                text:
                    "Enter your email and we’ll send you an OTP to reset your password.",
                fontSize: 12,
                color: ColorConstant.darkBrownColor,
              ),
              SizedBox(height: Get.height * 0.03),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textUtils.textWidget(
                      text: "Email Address",
                      fontSize: 12.0,
                      color: ColorConstant.darkBrownColor,
                    ),
                    SizedBox(height: Get.height * 0.015),
                    TextFormField(
                      controller: authController.forgotEmailController,
                      cursorColor: ColorConstant.cursorColor,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        if (!GetUtils.isEmail(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: customInputDecoration(
                        hintText: "example@email.com",
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),

                    // Send OTP Button
                    buttonWidget.buttonWidget(
                      borderColor: ColorConstant.secondaryColor,
                      btnColor: ColorConstant.secondaryColor,
                      text: "Send OTP",
                      textColor: ColorConstant.whiteColor,
                      borderRadius: 30.0,
                      actionPerform: () async {
                        if (_formKey.currentState!.validate()) {
                          await authController.sendForgotPasswordOtp();
                        }
                      },
                      fontSize: 14.0,
                    ),

                    SizedBox(height: Get.height * 0.04),

                    // Back to Sign In
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textUtils.textWidget(
                            text: "Remember your password?",
                            fontSize: 10.0,
                            color: ColorConstant.darkBrownColor,
                          ),
                          buttonWidget.textButton(
                            text: " Sign In",
                            textColor: ColorConstant.secondaryColor,
                            fontSize: 11.0,
                            align: TextAlign.center,
                            action: () {
                              Get.back(); // Navigate back to login
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

