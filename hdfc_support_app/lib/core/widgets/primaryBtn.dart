import 'package:flutter/material.dart';
import '../constants/appColor.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color backgroundColor;

  // 🔹 NEW
  final IconData? icon;
  final double iconSize;
  final Color iconColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 450,
    this.height = 60,
    this.backgroundColor = AppColors.primary,

    // 🔹 icon-related
    this.icon,
    this.iconSize = 24,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed, // null → disabled automatically
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: isDisabled
              ? backgroundColor.withAlpha(60)
              : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        // 🔹 Button content
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lexend',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
