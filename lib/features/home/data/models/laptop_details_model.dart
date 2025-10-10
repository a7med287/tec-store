import 'package:equatable/equatable.dart';

class LaptopDetailsModel extends Equatable {
  final int? id, brandId, categoryId;
  final String? modelName, processor, gpu, screenSize, ports;
  final String? description, notes, warranty;
  final bool? hasCamera, hasKeyboard, hasTouchScreen;
  final dynamic brand, category;
  final List<dynamic> variants;
  final List<dynamic> images;
  final List<dynamic> ratings;
  final List<dynamic> repairRequests;

  const LaptopDetailsModel({
    this.id,
    this.brandId,
    this.categoryId,
    this.modelName,
    this.processor,
    this.gpu,
    this.screenSize,
    this.hasCamera,
    this.hasKeyboard,
    this.hasTouchScreen,
    this.ports,
    this.description,
    this.notes,
    this.warranty,
    this.brand,
    this.category,
    this.variants = const [],
    this.images = const [],
    this.ratings = const [],
    this.repairRequests = const [],
  });

  factory LaptopDetailsModel.fromJson(Map<String, dynamic> json) {
    return LaptopDetailsModel(
      id: json['id'] ?? 0,
      modelName: json['modelName'] ?? '',
      processor: json['processor'] ?? '',
      gpu: json['gpu'] ?? '',
      screenSize: json['screenSize'] ?? '',
      hasCamera: json['hasCamera'] ?? false,
      hasKeyboard: json['hasKeyboard'] ?? false,
      hasTouchScreen: json['hasTouchScreen'] ?? false,
      ports: json['ports'] ?? '',
      description: json['description'] ?? '',
      notes: json['notes'] ?? '',
      warranty: json['warranty'] ?? '',
      brandId: json['brandId'] ?? 0,
      categoryId: json['categoryId'] ?? 0,
      brand: json['brand'],
      category: json['category'],
      variants: json['variants'] ?? [],
      images: json['images'] ?? [],
      ratings: json['ratings'] ?? [],
      repairRequests: json['repairRequests'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'modelName': modelName,
      'processor': processor,
      'gpu': gpu,
      'screenSize': screenSize,
      'hasCamera': hasCamera,
      'hasKeyboard': hasKeyboard,
      'hasTouchScreen': hasTouchScreen,
      'ports': ports,
      'description': description,
      'notes': notes,
      'warranty': warranty,
      'brandId': brandId,
      'categoryId': categoryId,
      'brand': brand,
      'category': category,
      'variants': variants,
      'images': images,
      'ratings': ratings,
      'repairRequests': repairRequests,
    };
  }

  @override
  List<Object?> get props => [
    id,
    modelName,
    processor,
    gpu,
    screenSize,
    hasCamera,
    hasKeyboard,
    hasTouchScreen,
    ports,
    description,
    notes,
    warranty,
    brandId,
    categoryId,
    brand,
    category,
    variants,
    images,
    ratings,
    repairRequests,
  ];
}
