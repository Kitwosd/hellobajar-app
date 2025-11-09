// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hellobajar/utils/color_utils.dart';
import '../../../../utils/text_utils.dart';
import '../../../../widget/button_widgets.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Get.height * 0.08),
              textUtils.textWidget(
                text: "Change Password",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                //  fontFamily:Constants.PlayfairDisplay,
              ),
              SizedBox(height: Get.height * 0.01),
              textUtils.textWidget(
                text: "Enter your New Password Below",
                fontSize: 15.0,
                color: ColorConstant.greyColor,
              ),
              SizedBox(height: Get.height * 0.025),
              // New Password Field
              Align(
                alignment: Alignment.centerLeft,
                child: textUtils.textWidget(
                  text: "New Password",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height * 0.012),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter new password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 14.0,
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.02),

              // Confirm Password Field
              Align(
                alignment: Alignment.centerLeft,
                child: textUtils.textWidget(
                  text: "Confirm Password",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height * 0.012),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Re-enter new password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 14.0,
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.03),

              // Update Password Button
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: buttonWidget.buttonWidget(
                  text: "Update Password",
                  btnColor: ColorConstant.secondaryColor,
                  borderColor: ColorConstant.secondaryColor,

                  textColor: ColorConstant.whiteColor,
                  fontSize: 16.0,
                  borderRadius: 30.0,
                  fontWeight: FontWeight.w500,
                  actionPerform: () {},
                ),
              ),

              const SizedBox(height: 15),

              // Back to Login Text
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
