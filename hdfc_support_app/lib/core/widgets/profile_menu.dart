import 'package:flutter/material.dart';
import 'package:hdfc_support_app/core/constants/appColor.dart';
import 'package:hdfc_support_app/core/widgets/helperText.dart';

class ProfileMenu extends StatelessWidget {
  final String username;
  final VoidCallback onLogout;
  final VoidCallback onProfile;

  const ProfileMenu({
    super.key,
    required this.username,
    required this.onLogout,
    required this.onProfile,
  });

  void _showMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    final value = await showMenu<String>(
      context: context,
      position: position,
      items: const [
        PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person, size: 18),
              SizedBox(width: 8),
              Text('User Info'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, size: 18),
              SizedBox(width: 8),
              Text('Logout'),
            ],
          ),
        ),
      ],
    );

    if (value == 'profile') onProfile();
    if (value == 'logout') onLogout();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _showMenu(context),

        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HelperText(
                  text: username,
                  fontColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),

                const HelperText(
                  text: 'admin',
                  fontColor: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ],
            ),
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.only(right: 50),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/image/user.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
