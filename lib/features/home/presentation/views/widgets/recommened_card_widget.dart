import 'package:flutter/material.dart';
import 'package:tec_store/core/utils/app_images1.dart';
import 'package:tec_store/core/utils/app_theme.dart';

class RecommendedCardWidget extends StatelessWidget {
  const RecommendedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.surface,
      shadowColor: Colors.black12,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Assets.image2,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wireless Gaming Mouse",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.heading2.copyWith(
                      fontSize: 18,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      SizedBox(width: 4),
                      Text("4.7", style: TextStyle(fontSize: 14)),
                      SizedBox(width: 8),
                      Text("(320)", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "\$89",
                        style: AppTheme.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart),
              style: IconButton.styleFrom(
                foregroundColor: AppTheme.surface,
                backgroundColor: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
