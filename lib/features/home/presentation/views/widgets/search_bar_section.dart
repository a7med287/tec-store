import 'package:flutter/material.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../generated/l10n.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey, size: 24),
            const SizedBox(width: 8),
            Text(
              S.of(context).search,
              style: AppTheme.body.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
