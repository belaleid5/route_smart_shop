import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart';
import 'package:route_smart/core/services/cach/cach_manger.dart';
import 'package:route_smart/core/styles/app_images.dart';

enum ImagesType { svg, png, network, asset, file, memory, networkSvg }

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.imageType,
    required this.imagePath,
    super.key,
    this.height,
    this.borderRadius = 5.0,
    this.width,
    this.boxFit = BoxFit.fill,
    this.color,
    this.applySvgColor = false,
    this.fallbackPath,
    this.isCircular = false,
  });

  final ImagesType imageType;
  final String imagePath;
  final double? height;
  final double borderRadius;
  final double? width;
  final BoxFit boxFit;
  final Color? color;
  final bool applySvgColor;
  final String? fallbackPath;
  final bool isCircular;

  String get _securePath => imagePath.replaceFirst('http://', 'https://');

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasAbsolutePath && uri.hasScheme;
  }

  Widget _errorImage() {
    return ErrorImage(
      errorHeight: height,
      errorWidth: width,
      fit: boxFit,
      fallbackPath: fallbackPath,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    final placeholder = _PlaceholderImage(
      width: width,
      height: height,
      borderRadius: isCircular ? (width ?? 100) / 2 : borderRadius,
      isCircular: isCircular,
    );

    switch (imageType) {
      case ImagesType.svg:
        imageWidget = SvgPicture.asset(
          imagePath,
          height: height,
          width: width,
          fit: boxFit,
        );
      case ImagesType.networkSvg:
        if (!_isValidUrl(_securePath)) return _errorImage();
        imageWidget = SizedBox(
          height: height,
          width: width,
          child: SvgPicture.network(
            _securePath,
            fit: boxFit,
            placeholderBuilder: (_) => placeholder,
          ),
        );
      case ImagesType.png:
      case ImagesType.asset:
        imageWidget = Image.asset(
          imagePath,
          height: height,
          width: width,
          color: color,
          fit: boxFit,
          cacheWidth: width?.toInt(),
          cacheHeight: height?.toInt(),
          errorBuilder: (_, __, ___) => _errorImage(),
        );
      case ImagesType.file:
        imageWidget = Image.file(
          File(imagePath),
          height: height,
          width: width,
          fit: boxFit,
          errorBuilder: (_, __, ___) => _errorImage(),
        );
      case ImagesType.memory:
        imageWidget = Image.memory(
          base64Decode(imagePath.split('base64,').last),
          height: height,
          width: width,
          fit: boxFit,
          errorBuilder: (_, __, ___) => _errorImage(),
        );
      case ImagesType.network:
        if (!_isValidUrl(_securePath)) return _errorImage();
        imageWidget = kIsWeb
            ? Image.network(
                _securePath,
                height: height,
                width: width,
                fit: boxFit,
                errorBuilder: (_, __, ___) => _errorImage(),
              )
            : CachedNetworkImage(
                imageUrl: _securePath,
                height: height,
                width: width,
                memCacheWidth: 600,
                memCacheHeight: 400,
                cacheManager: CustomCacheManager.manager,
                cacheKey: _securePath,
                color: color,
                fit: boxFit,
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 200),
                placeholder: (context, url) => placeholder,
                errorWidget: (context, url, error) {
                  debugPrint('❌ Image Error: $error');
                  return _errorImage();
                },
              );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        isCircular ? (width ?? 100) / 2 : borderRadius,
      ),
      child: imageWidget,
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  const _PlaceholderImage({
    this.width,
    this.height,
    this.borderRadius = 5.0,
    this.isCircular = false,
  });

  final double? width, height, borderRadius;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    if (isCircular && width != null) {
      return ShimmerWidget.circular(size: width!);
    }
    return ShimmerWidget.rectangular(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      borderRadius: BorderRadius.circular(borderRadius!),
    );
  }
}

class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
    this.errorWidth,
    this.errorHeight,
    this.fit,
    this.fallbackPath,
  });

  final double? errorWidth, errorHeight;
  final BoxFit? fit;
  final String? fallbackPath;

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final path = fallbackPath ?? AppImages.noNetwork;
    final w = errorWidth ?? 92;
    final h = errorHeight ?? 92;
    final boxFit = fit ?? BoxFit.cover;


    if (_isSvg(path)) {
      return SvgPicture.asset(
        path,
        height: h,
        width: w,
        fit: boxFit,
      );
    }

    return Image.asset(
      path,
      height: h,
      width: w,
      fit: boxFit,
    );
  }
}