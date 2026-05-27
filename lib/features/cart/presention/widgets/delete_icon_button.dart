import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class DeleteIconButton extends StatefulWidget {
  const DeleteIconButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<DeleteIconButton> createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton>
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

    _scale = Tween<double>(
      begin: 1,
      end: 0.85,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _controller.forward();
    await _controller.reverse();

    if (!mounted) return;

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
            color: context.colors.primary.withValues(alpha: 0.08),
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colors.primary.withValues(alpha: 0.3),
            ),
            boxShadow: [
              BoxShadow(
                color: context.colors.primary.withValues(alpha: 0.15),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            size: 15,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}
