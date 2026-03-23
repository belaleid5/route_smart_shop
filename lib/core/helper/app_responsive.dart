import 'dart:math';

import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {

  const AppResponsive(
      {super.key,
      required this.width,
      required this.child,
      this.autoCalculateMediaQueryData = true});
  final double? width;
  final Widget child;
  final bool autoCalculateMediaQueryData;

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final aspectRatio = constraints.maxWidth / constraints.maxHeight;
          final scaledWidth = width!;
          final scaledHeight = width! / aspectRatio;

          final Widget childHolder = FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: Container(
              width: width,
              height: scaledHeight,
              alignment: Alignment.center,
              child: child,
            ),
          );

          if (autoCalculateMediaQueryData) {
            final mediaQueryData = MediaQuery.of(context);

            final overrideMediaQueryData = (mediaQueryData.size ==
                Size(constraints.maxWidth, constraints.maxHeight));

            final scaledViewInsets = getAppInsets(
                mediaQueryData: mediaQueryData,
                screenSize: mediaQueryData.size,
                scaledSize: Size(scaledWidth, scaledHeight));
            final scaledViewPadding = getResponsiveViewPadding(
                mediaQueryData: mediaQueryData,
                screenSize: mediaQueryData.size,
                scaledSize: Size(scaledWidth, scaledHeight));
            final scaledPadding = getPadding(
                padding: scaledViewPadding, insets: scaledViewInsets);

            if (overrideMediaQueryData) {
              return MediaQuery(
                data: mediaQueryData.copyWith(
                    size: Size(scaledWidth, scaledHeight),
                    viewInsets: scaledViewInsets,
                    viewPadding: scaledViewPadding,
                    padding: scaledPadding),
                child: childHolder,
              );
            }
          }

          return childHolder;
        },
      );
    }

    return child;
  }

  EdgeInsets getAppInsets(
      {required MediaQueryData mediaQueryData,
      required Size screenSize,
      required Size scaledSize}) {
    final leftInsetFactor = mediaQueryData.viewInsets.left / screenSize.width;
    final topInsetFactor = mediaQueryData.viewInsets.top / screenSize.height;
    final rightInsetFactor =
        mediaQueryData.viewInsets.right / screenSize.width;
    final bottomInsetFactor =
        mediaQueryData.viewInsets.bottom / screenSize.height;

    final scaledLeftInset = leftInsetFactor * scaledSize.width;
    final scaledTopInset = topInsetFactor * scaledSize.height;
    final scaledRightInset = rightInsetFactor * scaledSize.width;
    final scaledBottomInset = bottomInsetFactor * scaledSize.height;

    return EdgeInsets.fromLTRB(
        scaledLeftInset, scaledTopInset, scaledRightInset, scaledBottomInset);
  }

  EdgeInsets getResponsiveViewPadding(
      {required MediaQueryData mediaQueryData,
      required Size screenSize,
      required Size scaledSize}) {
    double scaledLeftPadding;
    double scaledTopPadding;
    double scaledRightPadding;
    double scaledBottomPadding;

    final leftPaddingFactor =
        mediaQueryData.viewPadding.left / screenSize.width;
    final topPaddingFactor =
        mediaQueryData.viewPadding.top / screenSize.height;
    final rightPaddingFactor =
        mediaQueryData.viewPadding.right / screenSize.width;
    final bottomPaddingFactor =
        mediaQueryData.viewPadding.bottom / screenSize.height;

    scaledLeftPadding = leftPaddingFactor * scaledSize.width;
    scaledTopPadding = topPaddingFactor * scaledSize.height;
    scaledRightPadding = rightPaddingFactor * scaledSize.width;
    scaledBottomPadding = bottomPaddingFactor * scaledSize.height;

    return EdgeInsets.fromLTRB(scaledLeftPadding, scaledTopPadding,
        scaledRightPadding, scaledBottomPadding);
  }

  EdgeInsets getPadding(
      {required EdgeInsets padding, required EdgeInsets insets}) {
    double scaledLeftPadding;
    double scaledTopPadding;
    double scaledRightPadding;
    double scaledBottomPadding;

    scaledLeftPadding = max(0, padding.left - insets.left);
    scaledTopPadding = max(0, padding.top - insets.top);
    scaledRightPadding = max(0, padding.right - insets.right);
    scaledBottomPadding = max(0, padding.bottom - insets.bottom);

    return EdgeInsets.fromLTRB(scaledLeftPadding, scaledTopPadding,
        scaledRightPadding, scaledBottomPadding);
  }
}
