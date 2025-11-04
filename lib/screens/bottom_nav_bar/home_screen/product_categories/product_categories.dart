import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({super.key});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appBar(
        title: 'Category',
        leadingIcon: Icons.arrow_back_ios,
        leadingAction: () {
          Get.toNamed('/bottomNavBar');
        },
      ),
    );
  }
}
