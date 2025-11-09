// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class SelectPaymentMethod extends StatefulWidget {
  SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  String selectedMethod = "Cash on Delivery";
  final buttonWidget = ButtonWidget();
  TextUtils textUtils = TextUtils();

  Widget paymentOption({required String title}) {
    bool isSelected = selectedMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = title;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color:
                isSelected ? ColorConstant.primaryColor : Colors.grey.shade300,
            width: 2,
          ),
          color:
              isSelected
                  ? ColorConstant.primaryColor.withOpacity(0.08)
                  : ColorConstant.whiteColor,
        ),
        child: Row(
          children: [
            // Image.asset(assetPath, height: 36, width: 36, fit: BoxFit.contain),
            SizedBox(width: 16),
            Expanded(
              child: textUtils.textWidget(
                text: title,
                fontSize: 16,
                color: ColorConstant.blackColor,
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? ColorConstant.primaryColor : Colors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBarWidget().appBar(
        title: 'Select Payment Method',
        leadingAction: () {
          Get.toNamed('/proceedToCheckout');
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            paymentOption(title: "Cash on Delivery"),
            paymentOption(title: "eSewa"),
            paymentOption(title: "Fonepay"),
            const Spacer(),

            // 🟩 Place Order Button
            SizedBox(
              width: double.infinity,
              child: buttonWidget.buttonWidget(
                text: "Confirm Payment",
                btnColor: ColorConstant.secondaryColor,
                borderColor: ColorConstant.secondaryColor,
                fontWeight: FontWeight.bold,
                textColor: ColorConstant.whiteColor,
                fontSize: 15.0,
                borderRadius: 14.0,
                // height: Get.height * 0.06,
                actionPerform: () {
                  Get.snackbar(
                    "Payment Method Selected",
                    "You selected: $selectedMethod",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.shade100,
                    colorText: Colors.black,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
