import 'package:flutter/material.dart';
import 'package:tec_store/features/home/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const String routName = "ProductDetailsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: const
          ProductDetailsViewBody(),
        )
    );
  }
}
