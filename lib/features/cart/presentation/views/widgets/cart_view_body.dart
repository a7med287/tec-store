import 'package:flutter/material.dart';
import 'package:tec_store/features/cart/data/models/cart_item_model.dart';
import 'package:tec_store/features/cart/presentation/views/widgets/cart_item_card.dart';
import 'package:tec_store/features/cart/presentation/views/widgets/discount_code_widget.dart';
import 'package:tec_store/features/cart/presentation/views/widgets/order_samary_widget.dart';

class CartViewBody extends StatelessWidget {
  CartViewBody({super.key});

  List<CartItemModel> cartList = [
    CartItemModel(
      id: 1,
      productType: "productType",
      productId: 3,
      productName: "productName",
      sku: "sku",
      quantity: 1,
      unitPrice: 200,
      discountAmount: 0,
      totalPrice: 200,
      stockAvailable: 20,
      image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
      addedAt: "2024-01-15T10:00:00Z",
    ),
    CartItemModel(
      id: 1,
      productType: "productType",
      productId: 3,
      productName: "productName",
      sku: "sku",
      quantity: 1,
      unitPrice: 200,
      discountAmount: 0,
      totalPrice: 200,
      stockAvailable: 20,
      image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
      addedAt: "2024-01-15T10:00:00Z",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          SizedBox(height: 32),
          CartItemCard(cartItemModel: cartList[0]),
          CartItemCard(cartItemModel: cartList[1]),
          SizedBox(height: 24),
          DiscountCodeCard(),
          SizedBox(height: 24),
          OrderSummaryCard(),
        ],
      ),
    );
  }
}
