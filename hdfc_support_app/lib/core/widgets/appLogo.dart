import 'package:flutter/material.dart';

class Applogo extends StatelessWidget {
  final double logoWidth;
  final double logoHeight;
  final double textSize;
  final EdgeInsets padding;
  final MainAxisAlignment alignment;
  final Color color;
  const Applogo({
    super.key,
    this.logoWidth = 61,
    this.logoHeight = 59,
    this.textSize = 24,
    this.padding = const EdgeInsets.only(left: 50),
    this.alignment = MainAxisAlignment.start,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          // SizedBox(width: 50),
          Image.asset(
            'assets/image/hdfcLogo.png',
            width: logoWidth,
            height: logoHeight,
          ),
          SizedBox(width: 10),
          Text(
            "LOG ANALYZER",
            style: TextStyle(
              color: color,
              fontSize: textSize,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }
}
