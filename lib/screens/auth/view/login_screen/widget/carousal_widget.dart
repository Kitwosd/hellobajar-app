// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class AutoScrollingInfiniteCarousel extends StatefulWidget {
  final List<String> images;
  final bool reverse;
  final double speed;

  const AutoScrollingInfiniteCarousel({
    Key? key,
    required this.images,
    this.reverse = false,
    this.speed = 10,
  }) : super(key: key);

  @override
  State<AutoScrollingInfiniteCarousel> createState() =>
      _AutoScrollingInfiniteCarouselState();
}

class _AutoScrollingInfiniteCarouselState
    extends State<AutoScrollingInfiniteCarousel> {
  late InfiniteScrollController _controller;

  final double _itemWidth = 80;

  // Reactive variables
  final RxBool isScrolling = true.obs;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() async {
    while (mounted && _controller.hasClients && isScrolling.value) {
      double offsetDelta = widget.speed * (widget.reverse ? -1 : 1);

      await _controller.animateTo(
        _controller.offset + offsetDelta,
        duration: const Duration(milliseconds: 606),
        curve: Curves.linear,
      );

      if (!isScrolling.value) break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.15,
      child: InfiniteCarousel.builder(
        itemCount: widget.images.length,
        itemExtent: _itemWidth,
        center: true,
        controller: _controller,
        itemBuilder: (context, itemIndex, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                widget.images[itemIndex],
                fit: BoxFit.cover,
                width: _itemWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
