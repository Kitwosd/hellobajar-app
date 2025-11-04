import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/constants/constants.dart';
import '../../../utils/color_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // Call Api

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('bottomNavBar');
    });

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Center(
        child: Image.asset(Constants.helloBajarLogo, height: Get.height * 0.19),
      ),
    );
  }
}
