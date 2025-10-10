import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tec_store/core/helpers/build_snak_bar.dart';
import 'package:tec_store/features/home/presentation/views/widgets/product_details_view_body.dart';
import '../../../data/models/laptop_model.dart';
import '../../cubits/produc_details_cubit/product_details_cubit.dart';

class ProductDetailsViewBodyBlockConsumer extends StatelessWidget {
  const ProductDetailsViewBodyBlockConsumer({super.key, required this.laptopModel});
  final LaptopModel laptopModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is ProductDetailsFailure) {
          buildSnackBar(context, "Failure: ${state.errorMessage}");
        }
      },
      builder: (context, state) {
        final isLoading = state is ProductDetailsLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child:  ProductDetailsViewBody(laptopModel: laptopModel,),
        );
      },
    );
  }
}
