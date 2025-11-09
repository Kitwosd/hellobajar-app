import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/constants/constants.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';
import 'package:hellobajar/widget/box_decoration_widget.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class ProceedToCheckout extends StatefulWidget {
  const ProceedToCheckout({super.key});

  @override
  State<ProceedToCheckout> createState() => _ProceedToCheckoutState();
}

class _ProceedToCheckoutState extends State<ProceedToCheckout> {
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();

  @override
  Widget build(BuildContext context) {
    final customerName = "Simran Sah";
    final phoneNumber = "+977 9812345678";
    final address = "Janakpur, Dhanusha, Nepal";
    final vendorName = "FreshMart Groceries";
    final deliveryFee = 120.0;
    final estimatedTime = "2-3 Days";
    final product = {
      "name": "Organic Apples",
      "price": 450.0,
      "qty": 2,
      "image": Constants.shoe,
    };

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBarWidget().appBar(title: "Proceed to Checkout"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.02,
          vertical: Get.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧍 Customer Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUtils.textWidget(text: customerName, fontSize: 18),
                  textUtils.textWidget(text: phoneNumber),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorConstant.primaryColor,
                        size: 20,
                      ),
                      SizedBox(width: Get.width * 0.02),
                      Expanded(child: textUtils.textWidget(text: address)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.01),

            // 🏪 Vendor + Product Details
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: boxDecoration(
                containerColor: Colors.grey.shade50,
                borderRadius: 16.0,
                borderColor: Colors.grey.shade300,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUtils.textWidget(
                    text: vendorName,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          Constants.shoe,
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
                              text: 'Sports Shoe with comfy sole',
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textUtils.textWidget(
                              text: "Qty: ${product["qty"]}",
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textUtils.textWidget(
                              text: "Rs. ${product["price"]}",
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.01),

            // 🚚 Delivery Details
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: boxDecoration(
                containerColor: Colors.grey.shade50,
                borderRadius: 16,
                borderColor: Colors.grey.shade300,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUtils.textWidget(text: "Delivery Details", fontSize: 18),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textUtils.textWidget(text: "Standard Delivery Fee"),
                      textUtils.textWidget(text: "Rs. $deliveryFee"),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textUtils.textWidget(text: "Estimated Delivery Time"),
                      textUtils.textWidget(text: estimatedTime),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.01),

            // 🧾 Invoice & Contact
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUtils.textWidget(text: "Invoice & Contact", fontSize: 18),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textUtils.textWidget(text: "Invoice Number"),
                      textUtils.textWidget(text: "#INV20251105"),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textUtils.textWidget(text: "Vendor Contact"),
                      textUtils.textWidget(text: "+977 9800000000"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.01),

            // 💰 Total
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: boxDecoration(
                containerColor: Colors.grey.shade50,
                borderRadius: 16.0,
                borderColor: Colors.grey.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textUtils.textWidget(text: "Total Amount"),
                  textUtils.textWidget(
                    text: "Rs. 500",
                    color: ColorConstant.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
          ],
        ),
      ),

      //  Floating Button (placed at bottom center)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
          vertical: Get.height * 0.01,
        ),
        child: SizedBox(
          width: double.infinity,
          height: Get.height * 0.07,
          child: buttonWidget.buttonWidget(
            text: "Place Order",
            btnColor: ColorConstant.secondaryColor,
            borderColor: ColorConstant.secondaryColor,
            fontWeight: FontWeight.bold,
            textColor: ColorConstant.whiteColor,
            fontSize: 14.0,
            borderRadius: 14.0,
            verticalHeight: Get.height * 0.01,
            horizontalHeight: 10.0,
            actionPerform: () {
              Get.toNamed('/selectPaymentMethodScreen');
              // Get.snackbar(
              //   "Order Placed",
              //   "Your order has been placed successfully!",
              //   snackPosition: SnackPosition.BOTTOM,
              //   backgroundColor: Colors.green.shade100,
              // );
            },
          ),
        ),
      ),
    );
  }
}
