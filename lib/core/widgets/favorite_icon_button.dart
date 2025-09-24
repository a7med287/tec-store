import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
    required this.onFavorite,
  });

  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onFavorite,
      icon: const Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.black12,
      ),
    );
  }
}