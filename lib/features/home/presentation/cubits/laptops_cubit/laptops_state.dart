part of 'laptops_cubit.dart';

abstract class LaptopsState {
  const LaptopsState();
}

class LaptopsInitial extends LaptopsState {}
class LaptopsLoading extends LaptopsState {}
class LaptopsSuccess extends LaptopsState {
  final List<LaptopModel> laptops;
  const LaptopsSuccess(this.laptops);
}
class LaptopsFailure extends LaptopsState {
  final String errorMessage;
  const LaptopsFailure(this.errorMessage);
}