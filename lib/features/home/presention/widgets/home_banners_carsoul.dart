import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/main_carousel_slider.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/home/presention/widgets/builde_banner_card.dart';

class HomeBannerCarousel extends StatelessWidget {
  const HomeBannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return MainCarouselSlider(
      options: CarouselOptions(
        height: 160,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
      ),
      items: [
        BuildBannerCard(
          title: 'New Season\nArrivals',
          bgColor: context.color.primary,
        ),
        BuildBannerCard(
          title: 'Exclusive\nCollection',
          bgColor: context.color.primary,
        ),
      ],
    ).animateBlur();
  }
}