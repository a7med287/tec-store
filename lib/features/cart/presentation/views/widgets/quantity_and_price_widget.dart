import 'package:flutter/material.dart';
import 'package:tec_store/features/cart/data/models/cart_item_model.dart';

class QuantityAndPriceWidget extends StatefulWidget {
  const QuantityAndPriceWidget({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  State<QuantityAndPriceWidget> createState() => _QuantityAndPriceWidgetState();
}

class _QuantityAndPriceWidgetState extends State<QuantityAndPriceWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantity > 1) {
                      quantity--;
                    }
                  });
                },
              ),
              Text(quantity.toString(), style: TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
        ),
        Spacer(),
        Text(
          "\$${(widget.cartItemModel.unitPrice) * quantity}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
