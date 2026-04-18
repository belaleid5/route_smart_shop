import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/custom_image.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
    required this.imageUrl,
    required this.onDelete,
  });

  final String imageUrl;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomImage(
            width: 100,
            height: 120,
            boxFit: BoxFit.cover,
            imageType: ImagesType.network,
            imagePath: imageUrl,
          ),
        ),
        Positioned(
          bottom: -8,
          left: -8,
          child: _DeleteIconButton(onTap: onDelete),
        ),
      ],
    );
  }
}

class _DeleteIconButton extends StatefulWidget {
  const _DeleteIconButton({required this.onTap});

  final VoidCallback onTap;

  @override
  State<_DeleteIconButton> createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<_DeleteIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _controller.forward();
    await _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red.shade200,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withValues(alpha: 0.15),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            size: 15,
            color: Colors.red.shade400,
          ),
        ),
      ),
    );
  }
}