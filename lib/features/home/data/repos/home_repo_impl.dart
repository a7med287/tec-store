import 'package:flutter/foundation.dart';
import 'package:tec_store/core/services/api_services.dart';
import 'package:tec_store/core/services/database_services.dart';
import 'package:tec_store/features/home/data/models/laptop_model.dart';
import 'package:tec_store/features/home/domain/repos/home_epo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;
  final DatabaseServices databaseServices;
  HomeRepoImpl(this.databaseServices, {required this.apiServices});

  @override
  Future<List<LaptopModel>> fetchLaptops() async {
    try {
      var response = await apiServices.get(
        "Laptop",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      // Check for error response
      if (response["statusCode"] != null && response["statusCode"] != 200) {
        throw Exception(response["message"] ?? "Failed to fetch laptops");
      }

      // Handle different response structures
      List<dynamic> laptopsData;

      if (response["data"] != null && response["data"]["items"] != null) {
        laptopsData = response["data"]["items"] as List<dynamic>;
      } else {
        throw Exception("Unexpected response format: ${response.keys}");
      }
      List<LaptopModel> laptops =
          laptopsData
              .map(
                (laptopJson) =>
                    LaptopModel.fromJson(laptopJson as Map<String, dynamic>),
              )
              .toList();

      return laptops;
    } catch (e) {
      debugPrint("Error in fetchLaptops: $e");
      rethrow;
    }
  }

  @override
  Future<List<LaptopModel>> fetchRecommendedLaptops() async {
    try {
      var response = await apiServices.get(
        "Laptop/recommended",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response["statusCode"] != 200) {
        throw Exception(response["message"] ?? "Failed to fetch laptops");
      }

      if (response["data"] == null || response["data"]["items"] == null) {
        throw Exception("Invalid response format: ${response.keys}");
      }

      final items = response["data"]["items"] as List<dynamic>;

      List<LaptopModel> laptops =
          items
              .map((e) => LaptopModel.fromJson(e as Map<String, dynamic>))
              .toList();

      return laptops;
    } catch (e) {
      debugPrint("Error in fetchRecommendedLaptops: $e");
      rethrow;
    }
  }
}
