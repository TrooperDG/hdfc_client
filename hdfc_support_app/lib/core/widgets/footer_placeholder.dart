import 'package:flutter/material.dart';
import 'package:hdfc_support_app/core/constants/appColor.dart';
import 'package:hdfc_support_app/core/widgets/helperText.dart';

class AppPlaceholderFooter extends StatelessWidget {
  const AppPlaceholderFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48,
      // width: double.infinity,
      // color: AppColors.secondary,
      // alignment: Alignment.center,
      // child: const Text(
      //   '© 2026 Log Analyzer. All rights reserved.',
      //   style: TextStyle(
      //     fontSize: 12,
      //     color: Color.fromARGB(137, 251, 251, 251),
      //   ),
      // ),
      height: 48, //
      width: double.infinity,
      color: AppColors.secondary,

      child: Center(
        child: HelperText(
          text:
              '© 2026 Log Analyzer. All rights reserved.\nBuilt for secure log monitoring and analysis.',
          fontColor: Colors.white,
          alignment: Alignment.center,
          fontSize: 12,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
