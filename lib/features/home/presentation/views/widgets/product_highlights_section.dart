import 'package:flutter/material.dart';
import 'package:tec_store/features/home/data/models/laptop_details_model.dart';

class ProductHighlightsSection extends StatelessWidget {
  const ProductHighlightsSection({super.key, required this.laptop});
  final LaptopDetailsModel laptop;

  @override
  Widget build(BuildContext context) {
    final List<_HighlightItem> highlights = [
      _HighlightItem(
        icon: Icons.bolt,
        text: 'Fast Performance',
        color: const Color(0xFFE9F9EE),
        iconColor: Colors.green,
      ),
      _HighlightItem(
        icon: Icons.emoji_events_outlined,
        text: 'Award Winner',
        color: const Color(0xFFEFF5FF),
        iconColor: Colors.blue,
      ),
      _HighlightItem(
        icon: Icons.computer_outlined,
        text: laptop.processor ?? 'Unknown CPU',
        color: const Color(0xFFF7F3FF),
        iconColor: Colors.deepPurple,
      ),
      _HighlightItem(
        icon: Icons.graphic_eq_outlined,
        text: laptop.gpu ?? 'GPU N/A',
        color: const Color(0xFFF7F3FF),
        iconColor: Colors.purple,
      ),
      _HighlightItem(
        icon: Icons.shield_outlined,
        text: '${laptop.warranty} Warranty',
        color: const Color(0xFFF7F3FF),
        iconColor: Colors.purple,
      ),
      _HighlightItem(
        icon: Icons.local_shipping_outlined,
        text: 'Free Shipping',
        color: const Color(0xFFFFF7F2),
        iconColor: Colors.deepOrange,
      ),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children:
          highlights
              .map(
                (item) => _HighlightCard(
                  icon: item.icon,
                  text: item.text,
                  color: item.color,
                  iconColor: item.iconColor,
                ),
              )
              .toList(),
    );
  }
}

class _HighlightItem {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  _HighlightItem({
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  });
}

class _HighlightCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  const _HighlightCard({
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
