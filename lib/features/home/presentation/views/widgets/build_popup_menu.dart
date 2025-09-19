import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_theme.dart';
import 'package:tec_store/features/auth/presentation/views/sign_in_view.dart';

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
        ],
    onSelected: (String value) {
      if (value == 'logout') {
        _showLogoutConfirmationDialog(context);
      }
    },
  );
}

// Function to show confirmation dialog with enhanced design and animation
void _showLogoutConfirmationDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5), // Dimmed background
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            title: const Text(
              'Confirm logout',
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Are you sure you want to log out?',
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  // Navigate to login page
                  Navigator.pushReplacementNamed(context, SignInView.routName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary, // Primary color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
