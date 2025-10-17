import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:tec_store/core/widgets/custom_button.dart';
import 'package:tec_store/core/widgets/favorite_icon_button.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import 'package:tec_store/features/home/presentation/views/widgets/product_details_images_list.dart';
import 'package:tec_store/features/home/presentation/views/widgets/product_highlights_section.dart';
import '../../../../../core/utils/app_theme.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../cubits/produc_details_cubit/product_details_cubit.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.laptopModel});
  final LaptopModel laptopModel;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductDetailsCubit>().state;
    if (state is ProductDetailsSuccess) {
      var laptop = state.laptop;

      return Padding(
        padding: const EdgeInsets.all(20).copyWith(top: 32),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(title: 'Laptop Details'),
              const SizedBox(height: 24),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child:
                        (laptop.images.isNotEmpty)
                            ? Image.network(laptop.images.first)
                            : Image.asset('assets/images/image1.jpg'),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: FavoriteIconButton(onFavorite: () {}),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const ImagesList(),
              const SizedBox(height: 12),
              //laptop name
              Row(
                children: [
                  Text(
                    laptop.modelName ?? 'Unknown Laptop',
                    style: AppTheme.heading2.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              //rating and price
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 28),
                  const SizedBox(width: 4),
                  Text(
                    laptopModel.rate.toString(),
                    style: AppTheme.body.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " (${laptopModel.reviewsCount} reviews)",
                    style: AppTheme.body.copyWith(color: Colors.grey),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "\$${laptopModel.price ?? 0}",
                        style: AppTheme.heading1.copyWith(
                          color: AppTheme.primary,
                        ),
                      ),
                      if (laptopModel.discountedPrice != null)
                        Text(
                          "\$${laptopModel.discountedPrice}",
                          style: AppTheme.body.copyWith(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const DottedLine(
                dashLength: 6,
                dashGapLength: 4,
                lineThickness: 1,
                dashColor: Colors.grey,
              ),
              const SizedBox(height: 8),

              //description
              Row(
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
                laptopModel.shortDescription ?? 'No description available',
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                moreStyle: const TextStyle(color: AppTheme.primary),
                lessStyle: const TextStyle(color: AppTheme.primary),
              ),

              SizedBox(height: 16),
              ProductHighlightsSection(laptop: laptop),
              const SizedBox(height: 24),
              const CustomButton(text: "Add to cart"),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
