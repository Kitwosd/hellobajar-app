import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/text_utils.dart';
import '../../../../widget/button_widgets.dart';
import 'controller/my_profile_controller.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController profileController = Get.find<ProfileController>();
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:
      EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width*0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8.0,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [Align(alignment: Alignment.centerLeft,
                          child: CircleAvatar(backgroundImage: AssetImage('assets/products/jacket.png'),radius: 45,)),
                    ]),
                    Column(
                      children: [
                        textUtils.textWidget(text: "Krishna Singh",
                        fontSize: 16)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
