// ignore_for_file: file_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hellobajar/routes/app_routes.dart';
import 'package:hellobajar/screens/auth/view/login_screen/login_screen.dart';
import 'package:hellobajar/screens/auth/view/register_screen/register_screen.dart';
import 'package:hellobajar/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:hellobajar/screens/bottom_nav_bar/cart_screen/cart_screen.dart';
import 'package:hellobajar/screens/bottom_nav_bar/home_screen/product_categories/product_categories.dart';
import 'package:hellobajar/screens/start_screen/guest_screen.dart';
import 'package:hellobajar/screens/start_screen/splash_screen.dart';

class AppPages {
  static final List<GetPage> routes = [
    //strat of the app
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.guestScreen, page: () => GuestScreen()),
    //auth section
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(name: AppRoutes.registerScreen, page: () => RegisterScreen()),
    //bottomnavbar
    GetPage(name: AppRoutes.bottomNavBar, page: () => BottomNavBar()),
    GetPage(name: AppRoutes.bottomNavBar, page: () => BottomNavBar()),
    GetPage(
      name: AppRoutes.productCategoriesScreen,
      page: () => ProductCategories(),
    ),

    //cart screen
    GetPage(name: AppRoutes.cartScreen, page: () => CartScreen()),
  ];
}
