import 'package:flutter/material.dart';
import 'package:hdfc_support_app/features/auth/presentation/widgets/loginLeftPanel.dart';
import 'package:hdfc_support_app/features/auth/presentation/widgets/loginRightPanel.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/loginBackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            // color: Colors.orangeAccent,
            width: 1198,
            height: 750,
            child: Row(
              children: [
                //CONTAINER------------------------------------------------------------------------------1
                Loginleftpane(),

                //CONTAINER------------------------------------------------------------------------------2
                Loginrightpanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
