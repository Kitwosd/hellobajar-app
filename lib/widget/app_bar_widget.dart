import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellobajar/constants/constants.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class AppBarWidget {
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();

  AppBar appBar({
    VoidCallback? leadingAction,
    IconData? leadingIcon,
    required String title,
    String? endText,
    VoidCallback? endTextAction,
    List<Widget>? action,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading:
          leadingIcon != null
              ? GestureDetector(
                onTap: leadingAction,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: CircleAvatar(
                    backgroundColor: ColorConstant.backgroundColor,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(
                          leadingIcon,
                          color: ColorConstant.darkBrownColor,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              : null,

      elevation: 10.0,
      iconTheme: IconThemeData(color: ColorConstant.whiteColor, size: 13.0),
      title: textUtils.textWidget(
        text: title,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      centerTitle: true,
      actions: [
        if (action != null) ...action,
        if (endText != null)
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Center(
              child: buttonWidget.textButton(
                text: endText,
                textColor: ColorConstant.secondaryColor,
                fontSize: 12.0,
                action: endTextAction,
              ),
            ),
          ),
      ],
      backgroundColor: ColorConstant.darkBrownColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
