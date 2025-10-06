import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tec_store/features/home/presentation/views/widgets/recommened_card_widget.dart';

class RecommendedSection extends StatefulWidget {
  const RecommendedSection({super.key});

  @override
  State<RecommendedSection> createState() => _RecommendedSectionState();
}

class _RecommendedSectionState extends State<RecommendedSection> {
  final ScrollController _scrollController = ScrollController();
  late Timer _autoScrollTimer;
  final double _itemWidth = 380 + 16;
  final int _itemCount = 5;

  @override
  void initState() {
    super.initState();
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
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _itemCount,
            itemBuilder: (context, index) {
             // final actualIndex = index % _itemCount;

              return Padding(
                padding:
                    Intl.getCurrentLocale() == "ar"
                        ? EdgeInsets.only(left: 16.0)
                        : EdgeInsets.only(right: 16.0),
                child: SizedBox(width: 380, child: RecommendedCardWidget()),
              );
            },
          ),
        ),
      ],
    );
  }

  void _startAutoScroll() {
    const scrollDuration = Duration(milliseconds: 600);
    const waitDuration = Duration(seconds: 2);

    _autoScrollTimer = Timer.periodic(waitDuration, (timer) {
      if (!_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final current = _scrollController.offset;

      double nextOffset = current + _itemWidth ;

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
