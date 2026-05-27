import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
    this.child,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  });

  const ShimmerWidget.rectangular({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : child = null;

  ShimmerWidget.rounded({
    super.key,
    required this.height,
    required this.width,
    double radius = 8.0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  })  : borderRadius = BorderRadius.circular(radius),
        child = null;

  ShimmerWidget.circular({
    super.key,
    required double size,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  })  : height = size,
        width = size,
        borderRadius = BorderRadius.circular(size / 2),
        child = null;

  ShimmerWidget.square({
    super.key,
    required double size,
    double? radius,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  })  : height = size,
        width = size,
        borderRadius = radius != null ? BorderRadius.circular(radius) : null,
        child = null;

  ShimmerWidget.text({
    super.key,
    double width = double.infinity,
    double height = 16,
    double radius = 4.0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  })  : height = height,
        width = width,
        borderRadius = BorderRadius.circular(radius),
        child = null;

  ShimmerWidget.button({
    super.key,
    double width = 150,
    double height = 48,
    double radius = 8.0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  })  : height = height,
        width = width,
        borderRadius = BorderRadius.circular(radius),
        child = null;

  ShimmerWidget.card({
    super.key,
    double width = double.infinity,
    double height = 200,
    double radius = 0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  })  : height = height,
        width = width,
        borderRadius = BorderRadius.circular(radius),
        child = null;

  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Color? baseColor;
  final Color? highlightColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final effectiveBaseColor = baseColor ??
        (isDark
            ? colors.fieldBackground.withOpacity(0.8)
            : colors.stroke.withOpacity(0.7));

    final effectiveHighlightColor = highlightColor ??
        (isDark
            ? colors.secondary.withOpacity(0.3)
            : colors.shades.withOpacity(0.8));

    return Container(
      margin: margin,
      child: Shimmer(
        gradient: _buildGradient(
          baseColor: effectiveBaseColor,
          highlightColor: effectiveHighlightColor,
        ),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: effectiveBaseColor,
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
          child: child,
        ),
      ),
    );
  }

  LinearGradient _buildGradient({
    required Color baseColor,
    required Color highlightColor,
  }) {
    return LinearGradient(
      colors: [baseColor, highlightColor, baseColor],
      stops: const [0.1, 0.3, 0.4],
      begin: const Alignment(-1, -0.3),
      end: const Alignment(1, 0.3),
    );
  }
}

// ====================== Shimmer Brand Item (مستطيل) ======================

class ShimmerBrandItem extends StatelessWidget {
  const ShimmerBrandItem({
    super.key,
    this.width = 85,
    this.height = 70,
    this.nameWidth = 70,
    this.showName = true,
    this.radius = 12.0,
  });

  final double width;
  final double height;
  final double nameWidth;
  final bool showName;
  final double radius;

  static const double _nameSpacing = 10;
  static const double _nameHeight = 14;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalNeeded = height + (showName ? _nameSpacing + _nameHeight : 0.0);

        final effectiveTotalHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight.clamp(0.0, totalNeeded)
            : totalNeeded;

        final effectiveLogoHeight = showName
            ? (effectiveTotalHeight - _nameSpacing - _nameHeight).clamp(40.0, height)
            : effectiveTotalHeight;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerWidget.rounded(
              width: width,
              height: effectiveLogoHeight,
              radius: radius,
            ),
            if (showName) ...[
              verticalSpace(_nameSpacing),
              ShimmerWidget.text(
                width: nameWidth,
                height: _nameHeight,
              ),
            ],
          ],
        );
      },
    );
  }
}

// ====================== باقي الـ Shimmer Widgets ======================

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({
    super.key,
    this.avatarSize = 50,
    this.showSubtitle = true,
  });

  final double avatarSize;
  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ShimmerWidget.circular(size: avatarSize),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerWidget.text(width: 150),
                if (showSubtitle) ...[
                  verticalSpace(8),
                  ShimmerWidget.text(width: 100, height: 12),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerCardTile extends StatelessWidget {
  const ShimmerCardTile({
    super.key,
    this.avatarSize = 56,
    this.showSubtitle = true,
    this.avatarRadius,
    this.titleWidthFactor = 0.55,
    this.subtitleWidthFactor = 0.35,
    this.showTrailing = true,
    this.trailingSize = 36.0,
    this.cardBorderRadius = 16.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.outerPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 6,
    ),
  });

  final double avatarSize;
  final bool showSubtitle;
  final double? avatarRadius;
  final double titleWidthFactor;
  final double subtitleWidthFactor;
  final bool showTrailing;
  final double trailingSize;
  final double cardBorderRadius;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry outerPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: BorderRadius.circular(cardBorderRadius),
          border: Border.all(color: context.colors.stroke),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: contentPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAvatar(),
            horizontalSpace(14),
            Expanded(
              child: _buildTextLines(),
            ),
            if (showTrailing) ...[
              horizontalSpace(8),
              ShimmerWidget.rounded(
                width: trailingSize,
                height: trailingSize,
                radius: 10,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    if (avatarRadius == null) {
      return ShimmerWidget.circular(size: avatarSize);
    }
    return ShimmerWidget.rounded(
      width: avatarSize,
      height: avatarSize,
      radius: avatarRadius!,
    );
  }

  Widget _buildTextLines() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerWidget.text(
              width: availableWidth * titleWidthFactor,
              height: 14,
            ),
            if (showSubtitle) ...[
              verticalSpace(8),
              ShimmerWidget.text(
                width: availableWidth * subtitleWidthFactor,
                height: 12,
              ),
            ],
          ],
        );
      },
    );
  }
}

class ShimmerGridItem extends StatelessWidget {
  const ShimmerGridItem({
    super.key,
    this.imageHeight = 160,
    this.radius = 16,
  });

  final double imageHeight;
  final double radius;

  static const double _footerHeight = 12 + 16 + 8 + 14;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableImageHeight = constraints.hasBoundedHeight
            ? (constraints.maxHeight - _footerHeight).clamp(0.0, imageHeight)
            : imageHeight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              child: ShimmerWidget(
                height: availableImageHeight,
                width: double.infinity,
              ),
            ),
            verticalSpace(12),
            ShimmerWidget.text(),
            verticalSpace(8),
            ShimmerWidget.text(width: 100, height: 14),
          ],
        );
      },
    );
  }
}