import 'package:tec_store/features/home/data/models/laptop_model.dart';

abstract class HomeRepo {
  Future<List<LaptopModel>> fetchLaptops();
}
