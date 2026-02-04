import 'package:flutter/material.dart';
import 'package:hdfc_support_app/core/widgets/primaryBtn.dart';
import 'package:hdfc_support_app/features/auth/presentation/widgets/textField2.dart';

//!REFACTOR -> change the file names to follow the lower_case_with_underscores style

// import '../../../../shared/services/loginAPI.dart';
import '../../../../core/constants/appColor.dart';
import '../../../../core/widgets/headingText.dart';

//state
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/app/state/auth_providers.dart';

class Loginrightpanel extends ConsumerStatefulWidget {
  const Loginrightpanel({super.key});

  @override
  ConsumerState<Loginrightpanel> createState() => _LoginrightpanelState();
}

class _LoginrightpanelState extends ConsumerState<Loginrightpanel> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Stores REAL password
  // String _realPassword = '';

  void handleLogin() async {
    final employeeId = nameController.text.trim();
    final password = passwordController.text.trim();

    if (employeeId.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter all fields')));
      return;
    }

    ref
        .read(authProvider.notifier)
        .login(employeeId: employeeId, password: password);
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 675,
      decoration: BoxDecoration(
        color: const Color(0x8a004c8f),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: TitleSubtitleSection(
              title: "WELCOME",
              subtitle:
                  "Please Enter Your Credentials to get \naccess to Log Analyzer.",
              titleSize: 48,
              subtitleSize: 20,
              titleFont: "KonkhmerSleokchher",
              titleColor: AppColors.textOnPrimary,
              subtitleColor: AppColors.textOnPrimary,
              width: 550,
              height: 180,
              padding: const EdgeInsets.only(top: 50),
              sizedBoxHeight: 20,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 500,
              height: 420,
              child: Column(
                children: [
                  LabeledInputField(
                    label: 'Username',
                    hintText: 'Enter Username',
                    controller: nameController,
                    suffix: Icon(
                      Icons.person_outline,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  LabeledInputField(
                    label: 'Password',
                    hintText: 'Enter Password',
                    controller: passwordController,
                    isPassword: true,
                    // onPasswordChanged: (value) {
                    //   _realPassword = value; //store real password
                    // },
                  ),
                  const SizedBox(height: 8),
                  // const HelperText(text: 'Forgot Password?'),
                  // const HelperText(text: 'Invalid Username or Password.'),  ADD IT LATER
                  const SizedBox(height: 40),
                  PrimaryButton(text: "LOGIN", onPressed: handleLogin),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
