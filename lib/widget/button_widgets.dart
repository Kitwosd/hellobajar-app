// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/utils/text_utils.dart';

class ButtonWidget {
  TextUtils textUtils = TextUtils();

  iconButton({action, icon, Color, size}) {
    return GestureDetector(
      onTap: action,
      child: Icon(icon, color: Color, size: size ?? 15),
    );
  }

  textButton({action, text, bgColor, textColor, align, fontSize, fontFamily}) {
    return GestureDetector(
      onTap: action,
      child: textUtils.textWidget(
        text: text,
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: fontFamily,
        textAlign: align,
      ),
    );
  }

  textButtonWithUnderline({
    action,
    text,
    bgColor,
    textColor,
    align,
    fontSize,
    fontFamily,
  }) {
    return GestureDetector(
      onTap: action,
      child: textUtils.textWidget(
        text: text,
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: fontFamily,
        textAlign: align,
      ),
    );
  }

  buttonWidget({
    icon,
    iconColor,
    text,
    textColor,
    borderColor,
    btnColor,
    fontFamily,
    fontWeight,
    fontSize,
    borderRadius,
    actionPerform,
    borderWidth,
    verticalHeight,
    horizontalHeight,
  }) {
    return GestureDetector(
      onTap: actionPerform,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalHeight ?? 8.0,
          vertical: verticalHeight ?? 13.0,
        ),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth ?? 1.0),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 12.0, color: iconColor),
              textUtils.textWidget(
                text: text,
                color: textColor,
                textAlign: TextAlign.center,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontSize: fontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonWithActionIconWidget({
    icon,
    text,
    textColor,
    borderColor,
    btnColor,
    fontFamily,
    fontWeight,
    fontSize,
    borderRadius,
    actionPerform,
    borderWidth,
    verticalHeight,
    horizontalHeight,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalHeight ?? 8.0,
        vertical: verticalHeight ?? 13.0,
      ),
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth ?? 1.0),
      ),
      child: GestureDetector(
        onTap: actionPerform,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textUtils.textWidget(
                text: text,
                color: textColor,
                textAlign: TextAlign.center,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontSize: fontSize,
              ),
              Icon(icon, size: 12.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageButtonWithCircle({
    required String image,
    required VoidCallback onTap,
    required Color color,

    Color? borderColor,
    height,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: height,
        backgroundColor: color,

        child: Image.asset(image, height: height),
      ),
    );
  }

  Widget iconButtonWithCircle({
    required icon,
    required VoidCallback onTap,
    required Color color,

    Color? borderColor,
    double? height,
    double? width,
    double? borderRadius,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: Get.height * 0.05,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadiusDirectional.circular(borderRadius!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
