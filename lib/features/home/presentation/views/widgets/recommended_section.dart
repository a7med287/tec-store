import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tec_store/features/home/presentation/views/widgets/recommended_skeletonizer_loading.dart';
import 'package:tec_store/features/home/presentation/views/widgets/recommened_card_widget.dart';

import '../../cubits/recommended_laptops/recommended_laptops_cubit.dart';
import '../product_details_view.dart';

class RecommendedSection extends StatefulWidget {
  const RecommendedSection({super.key});

  @override
  State<RecommendedSection> createState() => _RecommendedSectionState();
}

class _RecommendedSectionState extends State<RecommendedSection> {
  final ScrollController _scrollController = ScrollController();
  late Timer _autoScrollTimer;
  final double _itemWidth = 370 + 16;

  @override
  void initState() {
    super.initState();
    context.read<RecommendedLaptopsCubit>().fetchRecommendedLaptops();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          child: BlocBuilder<RecommendedLaptopsCubit, RecommendedLaptopsState>(
            builder: (context, state) {
              if (state is RecommendedLaptopsLoading) {
                return SkeletonizerRecommendedLoading();
              } else if (state is RecommendedLaptopsFailure) {
                return Center(child: Text(state.message));
              } else if (state is RecommendedLaptopsSuccessful) {
                final laptops = state.laptops;
                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: laptops.length,
                  itemBuilder: (context, index) {
                    final laptop = laptops[index];
                    return Padding(
                      padding:
                          Intl.getCurrentLocale() == "ar"
                              ? EdgeInsets.only(left: 16.0)
                              : EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 370,
                        child: RecommendedCardWidget(laptopModel: laptop,onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsView(productId: laptop.id!, laptopModel: laptop,),
                            ),
                          );
                        },),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  //automatic scroll function
  void _startAutoScroll() {
    const scrollDuration = Duration(milliseconds: 600);
    const waitDuration = Duration(seconds: 2);

    _autoScrollTimer = Timer.periodic(waitDuration, (timer) {
      if (!_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final current = _scrollController.offset;

      double nextOffset = current + _itemWidth;

      if (nextOffset >= maxScroll) {
        _scrollController.jumpTo(0); // يرجع لأول بطاقة بسلاسة
      } else {
        _scrollController.animateTo(
          nextOffset,
          duration: scrollDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
