// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/screens/auth/controller/auth_controller.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/button_widgets.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final authController = Get.find<AuthController>();

  final TextEditingController otpController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textUtils.textWidget(
              text: "Verification Code",
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            SizedBox(height: Get.height * 0.02),
            textUtils.textWidget(
              text: "We have sent the verification code to your email address",
              fontSize: 16,
              // textAlign: TextAlign.center,
            ),
            SizedBox(height: Get.height * 0.02),

            Pinput(
              controller: otpController,
              focusNode: focusNode,
              length: 6,
              keyboardType: TextInputType.number,
              defaultPinTheme: PinTheme(
                height: 60,
                width: 60,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstant.blackColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              focusedPinTheme: PinTheme(
                height: Get.height * 0.065,
                width: Get.width * 0.65,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstant.secondaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.whiteColor,
                ),
              ),
            ),

            SizedBox(height: Get.height * 0.07),
            buttonWidget.buttonWidget(
              text: "Verify OTP",
              fontSize: 16.0,
              borderRadius: 9.0,
              btnColor: ColorConstant.secondaryColor,
              textColor: ColorConstant.whiteColor,
              borderColor: ColorConstant.secondaryColor,
              fontWeight: FontWeight.bold,
              actionPerform: () {
                final args = Get.arguments as Map?;
                final email = args?['email'] ?? '';
                final otp = otpController.text.trim();

                authController.verifyForgotPasswordOtp(email, otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
