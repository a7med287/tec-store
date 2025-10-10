part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final LaptopDetailsModel laptop;
  ProductDetailsSuccess(this.laptop);
}

class ProductDetailsFailure extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsFailure(this.errorMessage);
}
