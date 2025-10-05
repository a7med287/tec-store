import 'package:flutter/material.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import '../../generated/l10n.dart';
import '../utils/app_theme.dart';

class CardWidget extends StatelessWidget {
  final LaptopModel laptop;
  final bool isPopular;
  final VoidCallback onAddToCart;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.laptop,
    required this.onAddToCart,
    required this.onFavorite,
    required this.onTap,
    required this.isPopular,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.surface,
      shadowColor: Colors.black12,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                Ink.image(
                  image: AssetImage("assets/images/image1.jpg"),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  child: InkWell(onTap: onTap),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Item: The "Popular/New" badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isPopular ? Colors.orange : Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isPopular ? S.of(context).Popular : "New",
                          style: AppTheme.body.copyWith(color: Colors.white),
                        ),
                      ),

                      // Right Item: The favorite button
                      IconButton(
                        onPressed: onFavorite,
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laptop.name ?? "",
                  style: AppTheme.heading2.copyWith(
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "${laptop.rate} (${laptop.reviewsCount})",
                      style: AppTheme.body.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (laptop.isDiscounted!) ...[
                      Text(
                        '\$${laptop.discountedPrice}',
                        style: AppTheme.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '\$${laptop.price}',
                        style: AppTheme.body.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ] else ...[
                      Text(
                        '\$${laptop.price}',
                        style: AppTheme.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondary,
                        ),
                      ),
                    ],
                    const Spacer(),
                    IconButton(
                      onPressed: onAddToCart,
                      style: IconButton.styleFrom(
                        backgroundColor: AppTheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
