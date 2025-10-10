import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tec_store/features/home/data/models/laptop_details_model.dart';

import '../../../domain/repos/home_epo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final HomeRepo homeRepo;
  ProductDetailsCubit(this.homeRepo) : super(ProductDetailsInitial());

  Future<void> fetchProductDetails(int id) async {
    try {
      emit(ProductDetailsLoading());
      final laptop = await homeRepo.fetchLaptopDetails(id);
      emit(ProductDetailsSuccess(laptop));
    } catch (e) {
      emit(ProductDetailsFailure(e.toString()));
    }
  }
}
