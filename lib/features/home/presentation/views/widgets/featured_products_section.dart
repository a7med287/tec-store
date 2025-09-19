import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images1.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../core/widgets/card_widget.dart';
import '../../../../../generated/l10n.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).featuredProducts,
              style: AppTheme.heading2.copyWith(color: AppTheme.textPrimary),
            ),
            const Spacer(),
            Text(
              S.of(context).ViewAll,
              style: AppTheme.body.copyWith(color: AppTheme.secondary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 372,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
                child: SizedBox(
                  width: 250,
                  child: CardWidget(
                    title: "MacBook Pro 16",
                    imageUrl: Assets.image1,
                    rating: 4.8,
                    reviewCount: 423,
                    price: 289.0,
                    oldPrice: 300.0,
                    isPopular: index == 0,
                    onTap: () {},
                    onAddToCart: () {},
                    onFavorite: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
