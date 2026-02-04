import 'package:flutter/material.dart';

import '../../../../core/widgets/appLogo.dart';
import '../../../../core/widgets/headingText.dart';

class Loginleftpane extends StatelessWidget {
  const Loginleftpane({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 599,

      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          //logo+name
          Applogo(),
          SizedBox(height: 20),

          //heading Text
          Padding(
            padding: const EdgeInsets.only(left: 44),
            child: TitleSubtitleSection(
              title: "ERROR?!",
              subtitle: "Don’t panic. Let’s find the cause.",
              textAlign: TextAlign.left,
              crossAxisAlignment: CrossAxisAlignment.start,
              titleSize: 96,
              subtitleSize: 30,
              titleWeight: FontWeight.w800,
              subtitleWeight: FontWeight.w300,
              height: 200,
              sizedBoxHeight: 15,
            ),
          ),
        ],
      ),
    );
  }
}
