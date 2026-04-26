import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:route_smart/core/services/cach/cach_manger.dart';
import 'package:route_smart/core/styles/app_images.dart';
import 'package:route_smart/core/extensions/custom_shimmer.dart'; 
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

    // تجهيز الشيمر ليكون متطابقاً مع أبعاد وشكل الصورة المطلوبة
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
          colorFilter: applySvgColor
              ? ColorFilter.mode(color ?? Colors.red, BlendMode.srcIn)
              : null,
        );

      case ImagesType.networkSvg:
        if (!_isValidUrl(_securePath)) return _errorImage();
        imageWidget = SizedBox(
          height: height,
          width: width,
          child: SvgPicture.network(
            _securePath,
            fit: boxFit,
            colorFilter: applySvgColor
                ? ColorFilter.mode(color ?? Colors.red, BlendMode.srcIn)
                : null,
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
          errorBuilder: (context, error, stackTrace) => _errorImage(),
        );

      case ImagesType.file:
        imageWidget = Image.file(
          File(imagePath),
          height: height,
          width: width,
          color: color,
          fit: boxFit,
          errorBuilder: (context, error, stackTrace) => _errorImage(),
        );

      case ImagesType.memory:
        imageWidget = Image.memory(
          base64Decode(imagePath.split('base64,').last),
          height: height,
          width: width,
          color: color,
          fit: boxFit,
          errorBuilder: (context, error, stackTrace) => _errorImage(),
        );

      case ImagesType.network:
        if (!_isValidUrl(_securePath)) return _errorImage();
        imageWidget = kIsWeb
            ? Image.network(
                _securePath,
                height: height,
                width: width,
                color: color,
                fit: boxFit,
                errorBuilder: (context, error, stackTrace) => _errorImage(),
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
                
                // ✅ إعدادات التلاشي (Fade) لمنع الفراغ اللحظي
                fadeInDuration: const Duration(milliseconds: 500), // وقت ظهور الصورة
                fadeOutDuration: const Duration(milliseconds: 300), // وقت اختفاء الشيمر
                fadeInCurve: Curves.easeInOut, // حركة ظهور انسيابية
                
                placeholder: (context, url) => placeholder,
                errorWidget: (context, url, error) {
                  debugPrint('❌ CachedNetworkImage error: $error');
                  return _errorImage();
                },
              );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(isCircular ? (width ?? 100) / 2 : borderRadius),
      child: imageWidget,
    );
  }
}

// ══════════════════════════════════════════════════════
class _PlaceholderImage extends StatelessWidget {
  const _PlaceholderImage({
    this.width,
    this.height,
    this.borderRadius = 5.0,
    this.isCircular = false,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    if (isCircular && width != null) {
      return ShimmerWidget.circular(size: width!);
    }
    
    return ShimmerWidget.rectangular(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}

// ══════════════════════════════════════════════════════
class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
    this.errorWidth,
    this.errorHeight,
    this.fit,
    this.fallbackPath,
  });

  final double? errorWidth;
  final double? errorHeight;
  final BoxFit? fit;
  final String? fallbackPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      fallbackPath ?? AppImages.noNetwork,
      height: errorHeight ?? 92,
      width: errorWidth ?? 92,
      fit: fit ?? BoxFit.cover,
    );
  }
}