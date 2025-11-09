// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TextUtils {
  Text textWidget({
    required String text,
    Color? color,
    fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        overflow: overflow,
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        // overflow: overflow,
      ),
    );
  }

  Container textWidgetWithUnderline({
    required String text,
    Color? textColor,
    Color? underlineColor,
    fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    action,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: Get.height * 0.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: underlineColor!, width: 1.0)),
      ),
      child: GestureDetector(
        onTap: action,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontFamily: fontFamily,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
