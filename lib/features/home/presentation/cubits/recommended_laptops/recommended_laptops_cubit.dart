import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/laptop_model.dart';
import '../../../domain/repos/home_epo.dart';

part 'recommended_laptops_state.dart';

class RecommendedLaptopsCubit extends Cubit<RecommendedLaptopsState> {
  RecommendedLaptopsCubit(this.homeRepo) : super(RecommendedLaptopsInitial());

  final HomeRepo homeRepo;
  Future<void> fetchRecommendedLaptops() async {
    emit(RecommendedLaptopsLoading());
    try {
      final laptops = await homeRepo.fetchLaptops();
      emit(RecommendedLaptopsSuccessful(laptops: laptops));
    } catch (e) {
      emit(RecommendedLaptopsFailure(message: e.toString()));
    }
  }
}
