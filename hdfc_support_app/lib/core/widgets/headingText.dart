import 'package:flutter/material.dart';


class TitleSubtitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String titleFont;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final Color titleColor;
  final Color subtitleColor;
  final double titleSize;
  final double subtitleSize;
  final FontWeight titleWeight;
  final FontWeight subtitleWeight;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? sizedBoxHeight;

  const TitleSubtitleSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.black,
    this.titleSize = 48,
    this.subtitleSize = 20,
    this.titleWeight = FontWeight.w400,
    this.subtitleWeight = FontWeight.w500,
    this.titleFont = "Lexend",
    this.padding = EdgeInsets.zero,
    this.backgroundColor,
    this.width,
    this.height,
    this.sizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [

          Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: titleWeight,
              fontFamily: titleFont,
              color: titleColor,
              height: 1.0,
              // backgroundColor: Colors.red,
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          // SizedBox(height: 20),
          Transform.translate(
            offset: const Offset(0, -14),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subtitleSize,
                fontWeight: subtitleWeight,
                fontFamily: 'Lexend',
                color: subtitleColor,
                // backgroundColor: Colors.grey,
              ),
            ),
          ),

        ],
      ),
    );
  }
}




