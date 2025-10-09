import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_theme.dart';
import 'package:tec_store/features/edit_profile/presentation/views/edit_profile_view.dart';

import 'logout_dialog.dart';

Widget buildPopupMenu(BuildContext context) {
  return PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert, color: Colors.black54),
    itemBuilder:
        (BuildContext context) => [
          const PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: AppTheme.primary,
                ), // Added icon for visual appeal
                SizedBox(width: 8),
                Text('Logout', style: TextStyle(color: AppTheme.primary)),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'editProfile',
            child: Row(
              children: [
                Icon(
                  Icons.mode_edit_outline_rounded,
                  color: AppTheme.primary,
                ), // Added icon for visual appeal
                SizedBox(width: 8),
                Text('Edit Profile', style: TextStyle(color: AppTheme.primary)),
              ],
            ),
          ),
        ],
    onSelected: (String value) {
      if (value == 'logout') {
        showLogoutConfirmationDialog(context);
      } else if (value == 'editProfile') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfileView()),
        );
      }
    },
  );
}
