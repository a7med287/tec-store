import 'package:bloc/bloc.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import 'package:tec_store/features/home/domain/repos/home_epo.dart';

part 'laptops_state.dart';

class LaptopsCubit extends Cubit<LaptopsState> {
  final HomeRepo homeRepo;
  LaptopsCubit(this.homeRepo) : super(LaptopsInitial());
  void fetchLaptops() async {
    emit(LaptopsLoading());
    try {
      List<LaptopModel> laptops = await homeRepo.fetchLaptops();
      emit(LaptopsSuccess(laptops));
    } catch (e) {
      emit(LaptopsFailure(e.toString()));
      print("error in laptops cubit $e");
    }
  }
}
