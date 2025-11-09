import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/cart_screen/cart_screen.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/profile_screen.dart';
import 'package:hellobajar/screens/start_screen/guest_screen.dart';
import 'package:hellobajar/screens/auth/view/login_screen/login_screen.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/button_widgets.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/controller/my_profile_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  ButtonWidget buttonWidget = ButtonWidget();
  TextUtils textUtils = TextUtils();
  int _selectedIndex = 0;
  final box = GetStorage();

  bool get isLoggedIn {
    final token = box.read('accessToken');
    debugPrint(" Access token value: $token");

    if (token == null) return false;
    if (token is String) {
      final cleaned = token.trim().toLowerCase();
      return cleaned.isNotEmpty && cleaned != 'null';
    }
    return true;
  }

  @override
  void initState() {
    super.initState();

    // Initialize ProfileController once and make it permanent
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController(), permanent: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      GuestScreen(),
      isLoggedIn ? CartScreen() : _LoginRequiredScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent, // Remove ripple
              highlightColor: Colors.transparent, // Remove pressed effect
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorConstant.secondaryColor,
              unselectedItemColor: ColorConstant.greyColor,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              items: [
                BottomNavigationBarItem(
                  icon: _buildNavIcon(Icons.home_outlined, 0),
                  activeIcon: _buildNavIcon(Icons.home, 0, true),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(Icons.shopping_cart_outlined, 1),
                  activeIcon: _buildNavIcon(Icons.shopping_cart, 1, true),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(Icons.person_outline, 2),
                  activeIcon: _buildNavIcon(Icons.person, 2, true),
                  label: 'Account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index, [bool isActive = false]) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: isActive
          ? BoxDecoration(
              color: ColorConstant.secondaryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            )
          : null,
      child: Icon(icon, size: 26),
    );
  }
}

class _LoginRequiredScreen extends StatelessWidget {
  _LoginRequiredScreen();
  ButtonWidget buttonWidget = ButtonWidget();
  TextUtils textUtils = TextUtils();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, size: 80, color: Colors.grey),
            SizedBox(height: Get.height * 0.02),
            textUtils.textWidget(
              text: "Please log in to view your cart",
              textAlign: TextAlign.center,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: Get.height * 0.02),
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
}
