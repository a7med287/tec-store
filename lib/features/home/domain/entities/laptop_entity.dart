class LaptopEntity {
  final String id;
  final String name;
  final double price;
  final String category;
  final List<String> images;
  final double rate;
  final int reviewCount;
  final bool isDiscounted;
  final double discountedPrice;
  final String shortDescription;

  const LaptopEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.images,
    required this.rate,
    required this.reviewCount,
    required this.isDiscounted,
    required this.discountedPrice,
    required this.shortDescription,
  });
}
