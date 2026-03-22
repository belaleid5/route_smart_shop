import 'dart:math' as math show pi, sin;

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.color,
    this.size = 35.0,
    this.itemSize,
    this.itemCount,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  }) : assert(
         !(itemBuilder is IndexedWidgetBuilder && color is Color),
         'You should specify either a itemBuilder or a color',
       );

  final Color? color;
  final double size;
  final double? itemSize;
  final int? itemCount;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        (widget.controller ??
              AnimationController(vsync: this, duration: widget.duration))
          ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemSize = widget.itemSize ?? widget.size * 0.15;
    final itemCount = widget.itemCount ?? 12;

    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(itemCount, (i) {
            final position = widget.size * .5;
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                // ✅ الاسم الصحيح
                transform: Matrix4.rotationZ(
                  (360 / itemCount) * i * 0.0174533,
                ),
                child: Align(
                  child: FadeTransition(
                    opacity: DelayTween(
                      begin: 0,
                      end: 1,
                      delay: i / itemCount,
                    ).animate(_controller),
                    child: SizedBox.fromSize(
                      size: Size.square(itemSize),
                      child: _itemBuilder(i),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color ?? Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        );
}

class DelayTween extends Tween<double> {
  DelayTween({
    super.begin,
    super.end,
    required this.delay,
  });

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
