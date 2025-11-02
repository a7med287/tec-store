class CartItemModel {
  final int id;
  final String productType;
  final int productId;
  final String productName;
  final String sku;
  final int quantity;
  final double unitPrice;
  final double discountAmount;
  final double totalPrice;
  final int stockAvailable;
  final String image;
  final String addedAt;

  CartItemModel({
    required this.id,
    required this.productType,
    required this.productId,
    required this.productName,
    required this.sku,
    required this.quantity,
    required this.unitPrice,
    required this.discountAmount,
    required this.totalPrice,
    required this.stockAvailable,
    required this.image,
    required this.addedAt,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? 0,
      productType: json['productType'] ?? '',
      productId: json['productId'] ?? 0,
      productName: json['productName'] ?? '',
      sku: json['sku'] ?? '',
      quantity: json['quantity'] ?? 0,
      unitPrice: (json['unitPrice'] ?? 0).toDouble(),
      discountAmount: (json['discountAmount'] ?? 0).toDouble(),
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      stockAvailable: json['stockAvailable'] ?? 0,
      image: json['image'] ?? '',
      addedAt: json['addedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productType': productType,
      'productId': productId,
      'productName': productName,
      'sku': sku,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'discountAmount': discountAmount,
      'totalPrice': totalPrice,
      'stockAvailable': stockAvailable,
      'image': image,
      'addedAt': addedAt,
    };
  }
}
