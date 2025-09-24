import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_theme.dart';

class ImagesList extends StatefulWidget {
  const ImagesList({super.key});

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                Intl.getCurrentLocale() == "en"
                    ? const EdgeInsets.only(right: 8.0)
                    : const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: ImageItem(
                isChecked: currentIndex == index,
                imagePath: "assets/images/image4.jpg",
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.isChecked,
    required this.imagePath,
  });

  final bool isChecked;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return isChecked
        ? Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: AppTheme.primary, width: 2.0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(imagePath),
          ),
        )
        : ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(imagePath),
        );
  }
}
