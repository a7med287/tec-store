import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerRecommendedLoading extends StatelessWidget {
  const SkeletonizerRecommendedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: Intl.getCurrentLocale() == "ar" ? 0 : 16.0,
              left: Intl.getCurrentLocale() == "ar" ? 16.0 : 0,
            ),
            child: SizedBox(
              width: 380,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeletonizer(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Skeletonizer(
                              child: Container(
                                width: double.infinity,
                                height: 20,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(5, (_) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Skeletonizer(
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 8),
                            Skeletonizer(
                              child: Container(
                                width: 60,
                                height: 20,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Skeletonizer(
                        child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
