// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/widget/box_decoration_widget.dart';
import 'package:hellobajar/utils/color_utils.dart';

SearchBarWidget({
  containerWidth,
  hintText,
  TextEditingController? controller,
  Function()? actionPerform,
}) {
  return GestureDetector(
    onTap: actionPerform,
    child: Container(
      height: Get.height * 0.075,
      width: containerWidth,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      decoration: boxDecoration(borderRadius: 12.0),
      child: Row(
        children: [
          Icon(Icons.search, color: ColorConstant.greyColor),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              cursorColor: ColorConstant.cursorColor,
              cursorHeight: 20.0,
              controller: controller,
              style: TextStyle(fontSize: 12.0),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: ColorConstant.greyColor),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
