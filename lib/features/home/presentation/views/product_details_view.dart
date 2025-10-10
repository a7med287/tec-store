import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import 'package:tec_store/features/home/domain/repos/home_epo.dart';
import 'package:tec_store/features/home/presentation/views/widgets/product_details_view_body_block_consumer.dart';
import '../../../../core/services/get_it_service.dart';
import '../cubits/produc_details_cubit/product_details_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId, required this.laptopModel});

  final int productId;
  final LaptopModel laptopModel;
  static const String routName = "ProductDetailsView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              ProductDetailsCubit(getIt<HomeRepo>())
                ..fetchProductDetails(productId),
      child: Scaffold(
        body: SafeArea(child: ProductDetailsViewBodyBlockConsumer(laptopModel: laptopModel,)),
      ),
    );
  }
}
