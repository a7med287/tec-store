import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_store/features/home/presentation/cubits/laptops_cubit/laptops_cubit.dart';
import 'package:tec_store/features/home/presentation/views/product_details_view.dart';
import '../../../../../core/widgets/card_widget.dart';

class LaptopsGridView extends StatelessWidget {
  const LaptopsGridView({super.key});
  static const String routName = 'LaptopsGridView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Laptops')),
      body: BlocBuilder<LaptopsCubit, LaptopsState>(
        builder: (context, state) {
          if (state is LaptopsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LaptopsSuccess) {
            if (state.laptops.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.laptop_outlined, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No laptops available',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Check back later for new products',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              );
            }
            
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: state.laptops.length,
              itemBuilder: (context, index) {
                final laptop = state.laptops[index];
                return CardWidget(
                  laptop: laptop,
                  isPopular: index == 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsView(productId: laptop.id!, laptopModel: laptop,),
                      ),
                    );
                  },
                  onAddToCart: () {},
                  onFavorite: () {},
                );
              },
            );
          } else if (state is LaptopsFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Failed to load laptops',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<LaptopsCubit>().fetchLaptops(),
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
