import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();

  final box = GetStorage();

  bool get isLoggedIn {
    final token = box.read('accessToken');
    if (token == null) return false;
    if (token.toString().trim().isEmpty) return false;
    if (token.toString().toLowerCase() == 'null') return false;
    return true;
  }

  Map<String, dynamic>? get user =>
      (box.read('user') as Map?)?.cast<String, dynamic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBarWidget().appBar(
        // backgroundColor: ColorConstant.primaryColor,
        title: 'My Account',
      ),
      body: isLoggedIn ? _buildLoggedInView(context) : _buildGuestView(context),
    );
  }

  ///  Logged-in UI
  Widget _buildLoggedInView(BuildContext context) {
    final userData = user;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: ColorConstant.primaryColor,
                      backgroundImage:
                          userData?['avatar'] != null
                              ? NetworkImage(userData!['avatar'])
                              : null,
                      child:
                          userData?['avatar'] == null
                              ? Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              )
                              : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Add your image picker logic here
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstant.secondaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                textUtils.textWidget(
                  text:
                      "${userData?['first_name'] ?? ''} ${userData?['last_name'] ?? ''}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textUtils.textWidget(
                  text: userData?['email'] ?? '',
                  color: Colors.grey[700],
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          _buildMenuTile(Icons.shopping_bag_outlined, "My Profile", () {
            Get.toNamed('/profilePage');
          }),
          _buildMenuTile(Icons.shopping_bag_outlined, "My Orders", () {
            Get.toNamed('/myorderScreen');
          }),

          _buildMenuTile(Icons.logout, "Logout", () async {
            await box.erase();
            Get.offAllNamed('/loginScreen');
          }),
        ],
      ),
    );
  }

  /// Guest UI (when not logged in)
  Widget _buildGuestView(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline, size: 100, color: Colors.grey),
            SizedBox(height: Get.height * 0.02),
            textUtils.textWidget(
              text: "Welcome to HelloBajar!",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Get.height * 0.01),
            textUtils.textWidget(
              text:
                  "Sign in to manage your orders, wishlist, and profile settings.",
              textAlign: TextAlign.center,
              fontSize: 16,
              color: Colors.grey,
            ),
            SizedBox(height: Get.height * 0.03),
            SizedBox(
              width: Get.width * 0.4,
              child: buttonWidget.buttonWidget(
                borderColor: ColorConstant.secondaryColor,
                btnColor: ColorConstant.secondaryColor,
                text: 'Sign In',
                textColor: ColorConstant.whiteColor,
                borderRadius: 30.0,
                actionPerform: () async {
                  Get.offAllNamed('/loginScreen');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Common menu tile widget
  Widget _buildMenuTile(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: ColorConstant.secondaryColor),
          title: Text(title),
          trailing: Icon(Icons.chevron_right),
          onTap: onTap,
        ),
        Divider(height: 0),
      ],
    );
  }
}
