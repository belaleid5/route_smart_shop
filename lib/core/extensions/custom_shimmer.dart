import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Custom shimmer loading widget
///
/// Lightweight alternative to Skeletonizer with full gradient control
/// Supports light/dark themes automatically
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

  /// Creates a rectangular shimmer with optional border radius
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

  /// Creates a rounded shimmer with customizable corner radius
  ShimmerWidget.rounded({
    super.key,
    required this.height,
    required this.width,
    double radius = 8.0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : borderRadius = BorderRadius.circular(radius),
       child = null;

  /// Creates a circular shimmer (avatar/profile picture)
  ShimmerWidget.circular({
    super.key,
    required double size,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : height = size,
       width = size,
       borderRadius = BorderRadius.circular(size / 2),
       child = null;

  /// Creates a square shimmer with equal width and height
  ShimmerWidget.square({
    super.key,
    required double size,
    double? radius,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : height = size,
       width = size,
       borderRadius = radius != null ? BorderRadius.circular(radius) : null,
       child = null;

  /// Creates a text-line shimmer (for single line text)
  ShimmerWidget.text({
    super.key,
    double width = double.infinity,
    double height = 16,
    double radius = 4.0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : height = height,
       width = width,
       borderRadius = BorderRadius.circular(radius),
       child = null;

  /// Creates a button shimmer
  ShimmerWidget.button({
    super.key,
    double width = 150,
    double height = 48,
    double radius = 8.0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : height = height,
       width = width,
       borderRadius = BorderRadius.circular(radius),
       child = null;

  /// Creates a card shimmer
  ShimmerWidget.card({
    super.key,
    double width = double.infinity,
    double height = 200,
    double radius = 0,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.padding,
  }) : height = height,
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
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = colorScheme.brightness;

    // Custom gradient or default based on theme
    final gradient = _buildGradient(brightness);

    return Container(
      margin: margin,
      child: Shimmer(
        gradient: gradient,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color:
                baseColor ??
                Color.lerp(
                  colorScheme.surface,
                  colorScheme.outlineVariant,
                  0.5,
                ),
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
          child: child,
        ),
      ),
    );
  }

  LinearGradient _buildGradient(Brightness brightness) {
    // If custom colors provided, use them
    if (baseColor != null && highlightColor != null) {
      return LinearGradient(
        colors: [baseColor!, highlightColor!, baseColor!],
        stops: const [0.1, 0.3, 0.4],
        begin: const Alignment(-1, -0.3),
        end: const Alignment(1, 0.3),
      );
    }

    // Default gradients
    const shimmerGradientLight = LinearGradient(
      colors: [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1, -0.3),
      end: Alignment(1, 0.3),
    );

    const shimmerGradientDark = LinearGradient(
      colors: [
        Color(0xFF1C1C1C),
        Color(0xFF2C2C2C),
        Color(0xFF1C1C1C),
      ],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1, -0.3),
      end: Alignment(1, 0.3),
    );

    return brightness == Brightness.dark
        ? shimmerGradientDark
        : shimmerGradientLight;
  }
}

// ============================================
// Ready-to-use Shimmer Patterns
// ============================================

/// Brand carousel item shimmer
class ShimmerBrandItem extends StatelessWidget {
  const ShimmerBrandItem({
    super.key,
    this.size = 80,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerWidget.circular(size: size),
        const SizedBox(height: 8),
        ShimmerWidget.text(width: 60, height: 14),
      ],
    );
  }
}

/// List tile shimmer (avatar + text lines)
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.text(width: 150),
                if (showSubtitle) ...[
                  const SizedBox(height: 8),
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

/// Grid item shimmer (image + text)
class ShimmerGridItem extends StatelessWidget {
  const ShimmerGridItem({
    super.key,
    this.imageHeight = 150,
  });

  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget.card(
          height: imageHeight,
        ),
        const SizedBox(height: 12),
        ShimmerWidget.text(),
        const SizedBox(height: 8),
        ShimmerWidget.text(width: 100, height: 14),
      ],
    );
  }
}
