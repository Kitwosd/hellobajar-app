// ignore_for_file: deprecated_member_use, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:hellobajar/utils/color_utils.dart';

Decoration boxDecoration({
  Color? borderColor,
  double borderRadius = 7.0,
  Color? containerColor,
}) {
  return BoxDecoration(
    color: containerColor ?? Color(0xffEEEEEEEE).withOpacity(0.1),
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(color: ColorConstant.greyColor.withOpacity(0.2)),
  );
}
