import 'package:equatable/equatable.dart';

class LaptopModel extends Equatable {
  final int? id;
  final String? name;
  final double? price;
  final String? category;
  final List images;
  final double? rate;
  final int? reviewsCount;
  final bool? isDiscounted;
  final double? discountedPrice;
  final String? shortDescription;

  const LaptopModel({
    this.id,
    this.name,
    this.price,
    this.category,
    required this.images,
    this.rate,
    this.reviewsCount,
    this.isDiscounted,
    this.discountedPrice,
    this.shortDescription,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> json) => LaptopModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    category: json['category'] as String?,
    images: List<String>.from(json['images']),
    rate: (json['rate'] as num?)?.toDouble(),
    reviewsCount: json['reviewsCount'] as int?,
    isDiscounted: json['isDiscounted'] as bool?,
    discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
    shortDescription: json['shortDescription'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'category': category,
    'images': images,
    'rate': rate,
    'reviewsCount': reviewsCount,
    'isDiscounted': isDiscounted,
    'discountedPrice': discountedPrice,
    'shortDescription': shortDescription,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      price,
      category,
      images,
      rate,
      reviewsCount,
      isDiscounted,
      discountedPrice,
      shortDescription,
    ];
  }
}
