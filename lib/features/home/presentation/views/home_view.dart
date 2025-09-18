import 'package:flutter/material.dart';
import '../../../../core/utils/app_images1.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/card_widget.dart';
import '../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting + Notifications
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!',
                          style: AppTheme.heading1.copyWith(
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Find your perfect tech companion',
                          style: AppTheme.body.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.black54,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.withAlpha(20),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Search Bar
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          S.of(context).search,
                          style: AppTheme.body.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Featured Products Title
                Row(
                  children: [
                    Text(
                      S.of(context).featuredProducts,
                      style: AppTheme.heading2.copyWith(
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      S.of(context).VeiwAll,
                      style: AppTheme.body.copyWith(color: AppTheme.secondary),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Horizontal List of Cards (ListView.builder)
                SizedBox(
                  height: 366,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
                        child: SizedBox(
                          width: 230,
                          child: CardWidget(
                            title: "MacBook Pro 16",
                            imageUrl: Assets.image1,
                            rating: 4.8,
                            reviewCount: 423,
                            price: 289.0,
                            oldPrice: 300.0,
                            isPopular: index == 0,
                            onTap: () {},
                            onAddToCart: () {},
                            onFavorite: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
