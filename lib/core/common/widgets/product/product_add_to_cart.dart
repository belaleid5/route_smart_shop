import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class ProductAddToCartButton extends StatefulWidget {
  const ProductAddToCartButton({
    super.key,
    this.onTap,
    this.productId,
    this.isAdded = false,
  });

  final VoidCallback? onTap;
  final String? productId;
  final bool isAdded;

  @override
  State<ProductAddToCartButton> createState() => _ProductAddToCartButtonState();
}

class _ProductAddToCartButtonState extends State<ProductAddToCartButton>
    with SingleTickerProviderStateMixin {
  late bool _added;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _added = widget.isAdded;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 1.25,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void didUpdateWidget(ProductAddToCartButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isAdded != widget.isAdded) {
      setState(() => _added = widget.isAdded);
    }

    if (oldWidget.productId != widget.productId) {
      _controller.reset();
      setState(() => _added = widget.isAdded);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (_added) return;
    widget.onTap?.call();
    setState(() => _added = true);
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: _added ? context.colors.primary : context.colors.background,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _added
                    ? context.colors.primary.withValues(alpha: 0.35)
                    : context.colors.black.withValues(alpha: 0.1),
                blurRadius: _added ? 12 : 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Icon(
              _added ? Icons.check_rounded : Icons.shopping_cart_rounded,
              key: ValueKey(_added),
              size: 16,
              color: _added ? context.colors.white : context.colors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
