import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color_utils.dart';
import '../utils/product_text.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final double? radius;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? borderColor;
  final double? fontSize;
  final bool? isDownloadFile;
  final IconData? leading;

  // ignore: use_key_in_widget_constructors
  const CustomBtn(
      {required this.onTap,
      required this.title,
      this.radius,
      this.borderColor,
      this.height,
      this.width,
      this.fontSize,
      this.bgColor,
      this.leading,
      this.isDownloadFile = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: height ?? 50,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          border: Border.all(color: borderColor ?? ColorUtils.green),
          borderRadius: BorderRadius.circular(radius ?? 25),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius ?? 25),
          child: Center(
            child: ProductText(
              title!,
              color: bgColor == null ? ColorUtils.primaryColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

Future showSnackBar(
    {String? message,
    Color? snackColor,
    SnackPosition? snackPosition,
    Duration? showDuration}) async {
  return Get.showSnackbar(
    GetSnackBar(
      message: message,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      backgroundColor: snackColor ?? ColorUtils.primaryColor,
      duration: showDuration ?? const Duration(seconds: 2),
    ),
  );
}
