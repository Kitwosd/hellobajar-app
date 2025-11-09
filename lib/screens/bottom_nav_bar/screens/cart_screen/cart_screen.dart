// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/constants/constants.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  void onInit() {
    cartItems.addAll([
      CartItem(name: "Cotton T-Shirt", image: Constants.jacket, price: 599),
      CartItem(name: "Running Shoes", image: Constants.shoe, price: 1999),
      CartItem(name: "Analog Watch", image: Constants.airpod, price: 999),
    ]);
    super.onInit();
  }

  void addQuantity(int index) => cartItems[index].quantity++;
  void removeQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      cartItems.removeAt(index);
    }
  }

  void clearCart() => cartItems.clear();
}

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBarWidget().appBar(
        title: 'My Cart',
        leadingIcon: Icons.arrow_back_ios,
        leadingAction: () {
          Get.toNamed('/bottomNavBar');
        },
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: textUtils.textWidget(
              text: 'Your cart is empty 🛒',
              fontSize: 18,
              color: ColorConstant.greyColor,
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.image,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: Get.height * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textUtils.textWidget(
                                  text: item.name,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                SizedBox(height: Get.height * 0.01),
                                textUtils.textWidget(
                                  text: 'Rs. ${item.price.toStringAsFixed(2)}',
                                  fontSize: 14,
                                  color: ColorConstant.greyColor,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed:
                                    () => cartController.removeQuantity(index),
                              ),
                              textUtils.textWidget(
                                text: item.quantity.toString(),
                                fontSize: 16,
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed:
                                    () => cartController.addQuantity(index),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textUtils.textWidget(
                        text: 'Total:',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textUtils.textWidget(
                        text:
                            'Rs. ${cartController.totalPrice.toStringAsFixed(2)}',
                        fontSize: 18,
                        color: ColorConstant.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  buttonWidget.buttonWidget(
                    text: 'Proceed to Checkout',
                    btnColor: ColorConstant.secondaryColor,
                    borderColor: ColorConstant.secondaryColor,
                    textColor: ColorConstant.whiteColor,
                    fontSize: 14.0,
                    borderRadius: 12.0,
                    fontWeight: FontWeight.bold,
                    actionPerform: () {
                      Get.toNamed('/proceedToCheckout');
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
