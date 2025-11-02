import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/core/widgets/custom_small_button.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import 'package:tec_store/features/home/presentation/cubits/laptops_cubit/laptops_cubit.dart';
import 'package:tec_store/features/home/presentation/views/laptops_grid_view.dart';
import 'package:tec_store/features/home/presentation/views/product_details_view.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../core/widgets/card_widget.dart';
import '../../../../../generated/l10n.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});
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
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).featuredProducts,
              style: AppTheme.heading2.copyWith(color: AppTheme.textPrimary),
            ),
            const Spacer(),
            CustomSmallButton(
              onTap: () async {
                try {
                  // Fetch laptops before navigating
                  context.read<LaptopsCubit>().fetchLaptops();
                  // Navigate to laptops grid view
                  Navigator.pushNamed(context, LaptopsGridView.routName);
                } catch (e) {
                  debugPrint('View All button error: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to load laptops: $e')),
                  );
                }
              },
              text: S.of(context).ViewAll,
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
    );
  }
}
