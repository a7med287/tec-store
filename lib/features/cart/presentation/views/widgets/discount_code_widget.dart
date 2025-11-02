import 'package:flutter/material.dart';
import 'package:tec_store/core/widgets/custom_small_button.dart';
import 'package:tec_store/features/cart/presentation/views/widgets/discount_text_field.dart';

class DiscountCodeCard extends StatelessWidget {
  const DiscountCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.local_offer_outlined,
                color: Colors.lightBlue,
                size: 20,
              ),
              SizedBox(width: 6),
              Text(
                "Discount Code",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: DiscountTextField(controller: _controller)),
              const SizedBox(width: 10),
              CustomSmallButton(onTap: () {}, text: "Aplly"),
            ],
          ),
        ],
      ),
    );
  }
}
