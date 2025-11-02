import 'package:flutter/material.dart';
import 'package:tec_store/features/cart/data/models/cart_item_model.dart';
import 'package:tec_store/features/cart/presentation/views/widgets/quantity_and_price_widget.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cartItemModel.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemModel.productName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                ),

                Text(
                  "\$${cartItemModel.unitPrice}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.lightBlue.shade600,
                  ),
                ),
                SizedBox(height: 12),
                QuantityAndPriceWidget(cartItemModel: cartItemModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
