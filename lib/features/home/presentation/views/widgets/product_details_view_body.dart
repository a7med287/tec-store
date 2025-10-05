import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tec_store/core/widgets/card_widget.dart';
import 'package:tec_store/core/widgets/custom_button.dart';
import 'package:tec_store/core/widgets/favorite_icon_button.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import 'package:tec_store/features/home/presentation/views/product_details_view.dart';
import 'package:tec_store/features/home/presentation/views/widgets/product_details_images_list.dart';
import 'package:tec_store/generated/l10n.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});
  static const LaptopModel laptop = LaptopModel(
    id: 1,
    name: 'Laptop 1',
    price: 999.99,
    category: 'Electronics',
    images: [
      'assets/images/image1.jpg',
      'assets/images/image2.jpg',
      'assets/images/image3.jpg',
      'assets/images/image4.jpg',
      'assets/images/image5.jpg',
    ],
    rate: 4.5,
    reviewsCount: 120,
    isDiscounted: true,
    discountedPrice: 899.99,
    shortDescription: 'A high-performance laptop for all your needs.',
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 32),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 24),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/images/image4.jpg"),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: FavoriteIconButton(onFavorite: () {}),
                ),
              ],
            ),
            SizedBox(height: 12),
            ImagesList(),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "MacBook Pro 16",
                  style: AppTheme.heading2.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 28),
                const SizedBox(width: 4),
                Text(
                  "4.6",
                  style: AppTheme.body.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  " (228 reviews)",
                  style: AppTheme.body.copyWith(color: Colors.grey),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "\$33.399",
                      style: AppTheme.heading1.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    Text(
                      "\$36.399",
                      style: AppTheme.body.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            DottedLine(
              dashLength: 6,
              dashGapLength: 4,
              lineThickness: 1,
              dashColor: Colors.grey,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Product Description",
                  style: AppTheme.heading2.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            ReadMoreText(
              "The MacBook Pro 16-inch is a high-performance laptop designed for professionals, featuring a 16.2-inch Liquid Retina XDR display with a native resolution of 3456-by-2234 pixels at 254 pixels per inch, offering a 1,000,000 contrast ratio and XDR brightness of 1000 nits sustained full-screen and 1600 nits peak for HDR content.The device is available with various Apple silicon chips, including the M4 Pro and M4 Max, which offer up to a 16-core CPU and 40-core GPU, providing significant performance improvements for demanding tasks.",
              trimLines: 3,
              trimMode: TrimMode.Line,
              style: TextStyle(fontSize: 16, color: Colors.grey),
              moreStyle: TextStyle(color: AppTheme.primary),
              lessStyle: TextStyle(color: AppTheme.primary),
            ),
            SizedBox(height: 24),
            CustomButton(text: "Add to chart"),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context).similarproducts,
                  style: AppTheme.heading2.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 372,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
                    child: SizedBox(
                      width: 240,
                      child: CardWidget(
                        laptop: laptop,
                        isPopular: index == 0,
                        onTap: () {
                          try {
                            Navigator.pushNamed(
                              context,
                              ProductDetailsView.routName,
                            );
                          } catch (e) {
                            debugPrint('Navigation error: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Navigation failed: $e')),
                            );
                          }
                        },
                        onAddToCart: () {},
                        onFavorite: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
