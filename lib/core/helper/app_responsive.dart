import 'dart:math';
import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    super.key,
    required this.width,
    required this.child,
    this.autoCalculateMediaQueryData = true,
  });

  final double? width;
  final Widget child;
  final bool autoCalculateMediaQueryData;

  @override
  Widget build(BuildContext context) {
    if (width == null) return child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final aspectRatio = constraints.maxWidth / constraints.maxHeight;
        final scaledWidth = width!;
        final scaledHeight = width! / aspectRatio;

        final Widget childHolder = FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          child: Container(
            width: scaledWidth,
            height: scaledHeight,
            alignment: Alignment.center,
            child: child,
          ),
        );

        if (!autoCalculateMediaQueryData) {
          return childHolder;
        }

        final mediaQueryData = MediaQuery.of(context);
        final overrideMediaQueryData = (mediaQueryData.size ==
            Size(constraints.maxWidth, constraints.maxHeight));

        if (!overrideMediaQueryData) {
          return childHolder;
        }

        final scaledViewInsets = _getScaledInsets(
          mediaQueryData: mediaQueryData,
          screenSize: mediaQueryData.size,
          scaledSize: Size(scaledWidth, scaledHeight),
        );
        
        final scaledViewPadding = _getScaledPadding(
          mediaQueryData: mediaQueryData,
          screenSize: mediaQueryData.size,
          scaledSize: Size(scaledWidth, scaledHeight),
        );

        final scaledPadding = _getFinalPadding(
          padding: scaledViewPadding,
          insets: scaledViewInsets,
        );

        return MediaQuery(
          data: mediaQueryData.copyWith(
            size: Size(scaledWidth, scaledHeight),
            viewInsets: scaledViewInsets,
            viewPadding: scaledViewPadding,
            padding: scaledPadding,
          ),
          child: childHolder,
        );
      },
    );
  }

  EdgeInsets _getScaledInsets({
    required MediaQueryData mediaQueryData,
    required Size screenSize,
    required Size scaledSize,
  }) {
    final leftFactor = mediaQueryData.viewInsets.left / screenSize.width;
    final topFactor = mediaQueryData.viewInsets.top / screenSize.height;
    final rightFactor = mediaQueryData.viewInsets.right / screenSize.width;
    final bottomFactor = mediaQueryData.viewInsets.bottom / screenSize.height;

    return EdgeInsets.fromLTRB(
      leftFactor * scaledSize.width,
      topFactor * scaledSize.height,
      rightFactor * scaledSize.width,
      bottomFactor * scaledSize.height,
    );
  }

  EdgeInsets _getScaledPadding({
    required MediaQueryData mediaQueryData,
    required Size screenSize,
    required Size scaledSize,
  }) {
    final leftFactor = mediaQueryData.viewPadding.left / screenSize.width;
    final topFactor = mediaQueryData.viewPadding.top / screenSize.height;
    final rightFactor = mediaQueryData.viewPadding.right / screenSize.width;
    final bottomFactor = mediaQueryData.viewPadding.bottom / screenSize.height;

    return EdgeInsets.fromLTRB(
      leftFactor * scaledSize.width,
      topFactor * scaledSize.height,
      rightFactor * scaledSize.width,
      bottomFactor * scaledSize.height,
    );
  }

  EdgeInsets _getFinalPadding({
    required EdgeInsets padding,
    required EdgeInsets insets,
  }) {
    return EdgeInsets.fromLTRB(
      max(0, padding.left - insets.left),
      max(0, padding.top - insets.top),
      max(0, padding.right - insets.right),
      max(0, padding.bottom - insets.bottom),
    );
  }
}