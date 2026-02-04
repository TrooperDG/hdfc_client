import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/app/state/auth_providers.dart';
import 'package:hdfc_support_app/core/constants/appColor.dart';
import 'package:hdfc_support_app/core/widgets/appLogo.dart';
import 'package:hdfc_support_app/core/widgets/profile_menu.dart';
import 'package:hdfc_support_app/features/alert/presentation/alert_screen.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/dashboard_screen.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';
import 'package:hdfc_support_app/features/dashboard/state/stage/stage_provider.dart';

/// ------------------------------
/// Reusable Nav Text Button
/// ------------------------------
class NavTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final bool isDisabled;

  const NavTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.white,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: isDisabled ? null : onPressed,
      child: Text(label, style: TextStyle(color: color, fontSize: 18)),
    );
  }
}

/// ------------------------------
/// NavBar
/// ------------------------------
class NavBar extends ConsumerWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return AppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        children: [
          /// App Logo
          Applogo(
            logoHeight: 38,
            logoWidth: 42,
            textSize: 18,
            color: Colors.white,
          ),

          /// Center Navigation Items
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavTextButton(
                    label: 'Dashboard',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DashboardScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20),

                  NavTextButton(
                    label: 'Alert',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const AlertScreen()),
                      );
                    },
                  ),
                  const SizedBox(width: 20),

                  NavTextButton(
                    label: 'Settings',
                    color: Colors.white54,
                    isDisabled: true,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Settings Not Available now'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          /// Profile Menu
          ProfileMenu(
            username: authState.user?.email ?? 'username',
            onProfile: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User profile not available yet')),
              );
            },
            onLogout: () {
              ref.read(authProvider.notifier).logout();
              ref.read(stageProvider.notifier).reset();
              ref.read(journeyProvider.notifier).reset();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
