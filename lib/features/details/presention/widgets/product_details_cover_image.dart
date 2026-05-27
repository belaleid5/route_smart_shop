import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';
import 'package:route_smart/core/common/widgets/main_carousel_slider.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/details/presention/widgets/dots_indicator.dart';

class ProductDetailsCoverImage extends StatefulWidget {
  const ProductDetailsCoverImage({
    super.key,
    required this.imageCover,
    required this.images,
  });

  final String imageCover;
  final List<String> images;

  @override
  State<ProductDetailsCoverImage> createState() =>
      _ProductDetailsCoverImageState();
}

class _ProductDetailsCoverImageState extends State<ProductDetailsCoverImage> {
  int _currentIndex = 0;
  late List<String> _allImages;
  late CarouselOptions _carouselOptions;

  @override
  void initState() {
    super.initState();
    _updateImageList();
    _initCarouselOptions();
  }

  @override
  void didUpdateWidget(covariant ProductDetailsCoverImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageCover != oldWidget.imageCover ||
        widget.images != oldWidget.images) {
      _updateImageList();
      _initCarouselOptions();
    }
  }

  void _updateImageList() {
    _allImages = [
      if (widget.imageCover.isNotEmpty) widget.imageCover,
      ...widget.images.where((img) => img.isNotEmpty),
    ];
  }

  void _initCarouselOptions() {
    _carouselOptions = CarouselOptions(
      viewportFraction: 1.0,
      height: double.infinity,
      enableInfiniteScroll: _allImages.length > 1,
      onPageChanged: (index, reason) {
        if (mounted) {
          setState(() => _currentIndex = index);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_allImages.isEmpty) {
      return const SizedBox.shrink();
    }

    final screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: screenHeight * 0.45,
      child: Stack(
        children: [
          MainCarouselSlider.builder(
            itemCount: _allImages.length,
            options: _carouselOptions,
            itemBuilder: (context, index, realIndex) {
              return CustomImage(
                imagePath: _allImages[index],
                imageType: ImagesType.network,
                boxFit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          if (_allImages.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _allImages.length,
                  (index) => DotIndicator(isSelected: _currentIndex == index),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
