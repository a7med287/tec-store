import 'package:flutter/material.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../generated/l10n.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, Object>> categories = const [
  {
    "id": 6,
    "name": "2-in-1",
    "laptopsCount": 6
  },
  {
    "id": 8,
    "name": "Budget",
    "laptopsCount": 6
  },
  {
    "id": 3,
    "name": "Business",
    "laptopsCount": 6
  },
  {
    "id": 4,
    "name": "Creator",
    "laptopsCount": 6
  },
  {
    "id": 2,
    "name": "Gaming",
    "laptopsCount": 7
  },
  {
    "id": 5,
    "name": "Student",
    "laptopsCount": 6
  },
  {
    "id": 1,
    "name": "Ultrabook",
    "laptopsCount": 7
  },
  {
    "id": 7,
    "name": "Workstation",
    "laptopsCount": 6
  }
];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).sortBy,
          style: AppTheme.heading2.copyWith(color: AppTheme.textPrimary),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            childAspectRatio: 4.6 / 2,
          ),
          itemCount: categories.length,
          itemBuilder:
              (context, index) => Card(
                shadowColor: Colors.black12,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.zero,
                color: AppTheme.surface,
                child: ListTile(
                  title: Text(
                    categories[index]["name"] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    "${categories[index]["laptopsCount"]} Items",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  ),
              ),
        ),
      ],
    );
  }
}
