// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color_utils.dart';

InputDecoration customInputDecoration({
  required String hintText,
  TextStyle? hintStyle,
  bool isPasswordField = false,
  bool isPasswordVisible = false,
  Function()? suffixOnPress,
  Color? hintTextColor,
}) {
  final defaultHintStyle = TextStyle(
    fontSize: 12,
    color: ColorConstant.greyColor,
  );

  OutlineInputBorder buildBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 12,
      color: hintTextColor ?? Color(0xff929292),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    suffixIcon:
        isPasswordField
            ? GestureDetector(
              onTap: suffixOnPress,
              child: Icon(
                isPasswordVisible
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                color: ColorConstant.greyColor,
              ),
            )
            : null,
    border: buildBorder(ColorConstant.whitegreyColor),
    enabledBorder: buildBorder(ColorConstant.whitegreyColor),
    focusedBorder: buildBorder(ColorConstant.greyColor, width: 1),
    errorBorder: buildBorder(ColorConstant.redColor),
    focusedErrorBorder: buildBorder(ColorConstant.redColor),
  );
}
