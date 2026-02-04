import 'package:flutter/material.dart';

import '../constants/appColor.dart';

class HelperText extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final Color fontColor;
  final Alignment alignment;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final VoidCallback? onPressed;

  const HelperText({
    super.key,
    required this.text,
    this.padding = const EdgeInsets.only(left: 30),
    this.fontColor = AppColors.error,
    this.alignment = Alignment.centerLeft,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 18,
    this.textAlign,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: 'Lexend',
              color: fontColor,
              decoration: onPressed != null ? TextDecoration.underline : null,
            ),
          ),
        ),
      ),
    );
  }
}
