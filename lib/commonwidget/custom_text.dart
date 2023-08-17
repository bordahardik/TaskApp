import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
        required this.title,
        this.color,
        this.fontWeight,
        this.fontStyle,
        this.height,
        this.fontsize,
        this.textAlign})
      : super(key: key);
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? fontsize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontsize ?? 14,
        fontWeight: fontWeight,
        height: height,
        fontStyle: fontStyle,
        color: color,
      ),
    );
  }
}
