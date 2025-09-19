import 'package:flutter/material.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../generated/l10n.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, Object>> categories = const [
    {
      "title": "Gaming",
      "icon": Icons.games,
      "color": Colors.deepOrange,
      "items": 45,
    },
    {
      "title": "Business",
      "icon": Icons.computer,
      "color": Colors.blue,
      "items": 15,
    },
    {
      "title": "Accessories",
      "icon": Icons.headset,
      "color": Colors.purple,
      "items": 50,
    },
    {
      "title": "Smartphones",
      "icon": Icons.smartphone,
      "color": Colors.green,
      "items": 30,
    },
    {
      "title": "Laptops",
      "icon": Icons.laptop,
      "color": Colors.indigo,
      "items": 25,
    },
    {
      "title": "Wearables",
      "icon": Icons.watch,
      "color": Colors.teal,
      "items": 20,
    },
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
                    categories[index]["title"] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    "${categories[index]["items"]} Items",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: (categories[index]["color"] as Color).withAlpha(
                        100,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      categories[index]["icon"] as IconData,
                      color: categories[index]["color"] as Color,
                      size: 24,
                    ),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
