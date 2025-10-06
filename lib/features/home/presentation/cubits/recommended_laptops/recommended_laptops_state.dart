part of 'recommended_laptops_cubit.dart';

@immutable
sealed class RecommendedLaptopsState {}

final class RecommendedLaptopsInitial extends RecommendedLaptopsState {}

final class RecommendedLaptopsLoading extends RecommendedLaptopsState {}

final class RecommendedLaptopsSuccessful extends RecommendedLaptopsState {
  final List<LaptopModel> laptops;

  RecommendedLaptopsSuccessful({required this.laptops});
}

final class RecommendedLaptopsFailure extends RecommendedLaptopsState {
  final String message;

  RecommendedLaptopsFailure({required this.message});
}
