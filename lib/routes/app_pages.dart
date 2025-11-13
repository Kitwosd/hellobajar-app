// ignore_for_file: file_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hellobajar/routes/app_routes.dart';
import 'package:hellobajar/screens/auth/view/forget_password/OTP_screen.dart';
import 'package:hellobajar/screens/auth/view/forget_password/forget_password.dart';
import 'package:hellobajar/screens/auth/view/forget_password/reset_password.dart';
import 'package:hellobajar/screens/auth/view/login_screen/login_screen.dart';
import 'package:hellobajar/screens/auth/view/register_screen/register_screen.dart';
import 'package:hellobajar/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/cart_screen/cart_screen.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/cart_screen/proceed_to_checkout.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/cart_screen/select_payment_method.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/home_screen/home_screen.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/home_screen/product_categories/product_categories.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/my_orders/my_orders.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/my_profile.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/profile_page.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/profile_screen.dart';
import 'package:hellobajar/screens/start_screen/guest_screen.dart';
import 'package:hellobajar/screens/start_screen/splash_screen.dart';

class AppPages {
  static final List<GetPage> routes = [
    //START SCREEN
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.guestScreen, page: () => GuestScreen()),
    //AUTH SECTION
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(name: AppRoutes.registerScreen, page: () => RegisterScreen()),
    //BOTTOM NAV BAR
    GetPage(name: AppRoutes.bottomNavBar, page: () => BottomNavBar()),
    GetPage(
      name: AppRoutes.productCategoriesScreen,
      page: () => ProductCategoriesScreen(),
    ),
    //HOME SCREEN
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),

    //CART SCREEN
    GetPage(name: AppRoutes.cartScreen, page: () => CartScreen()),
    GetPage(name: AppRoutes.proceedToCheckout, page: () => ProceedToCheckout()),

    //SELECT PAYMENT METHOD SCREEN
    GetPage(
      name: AppRoutes.selectPaymentMethodScreen,
      page: () => SelectPaymentMethod(),
    ),

    //FORGET PASSWORD SCREEN
    GetPage(
      name: AppRoutes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
    ),

    //OTP SCREEN
    GetPage(name: AppRoutes.OTPScreen, page: () => OtpScreen()),

    //RESET PASSWORD SCREEN
    GetPage(name: AppRoutes.resetPasswordScreen, page: () => ResetPassword()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),

    GetPage(name: AppRoutes.myProfileScreen, page: () => MyProfileScreen()),
    GetPage(name: AppRoutes.myorderScreen, page: () => MyorderScreen()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
  ];
}
