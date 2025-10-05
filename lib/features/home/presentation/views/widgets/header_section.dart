import 'package:flutter/material.dart';
import 'package:tec_store/features/home/presentation/views/widgets/build_popup_menu.dart';
import '../../../../../core/utils/app_theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning!',
              style: AppTheme.heading1.copyWith(color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 4),
            Text(
              'Find your perfect tech companion',
              style: AppTheme.body.copyWith(color: Colors.grey),
            ),
          ],
        ),
        const Spacer(),

        //edit in future
        buildPopupMenu(context),

        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.notifications, color: Colors.black54),
        //   style: IconButton.styleFrom(
        //     backgroundColor: Colors.grey.withAlpha(20),
        //   ),
        // ),
      ],
    );
  }
}
