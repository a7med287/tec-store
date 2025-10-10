import 'package:tec_store/features/home/data/models/laptop_details_model.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';

abstract class HomeRepo {
  Future<List<LaptopModel>> fetchLaptops();
  Future<List<LaptopModel>> fetchRecommendedLaptops();
  Future<LaptopDetailsModel> fetchLaptopDetails(int id);
}
