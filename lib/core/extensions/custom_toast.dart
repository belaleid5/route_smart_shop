import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

enum ToastType { success, error, info }

class CustomToast {
  CustomToast._();

  static void show(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 5),
  }) {
    debugPrint(' CustomToast.show called');
    debugPrint('   Message: $message');
    debugPrint('   Type: $type');

    try {
      final overlay = Overlay.of(context, rootOverlay: true);
      debugPrint('    Overlay obtained');

      late OverlayEntry overlayEntry;

      overlayEntry = OverlayEntry(
        builder: (ctx) {
          debugPrint('   Building toast widget');
          return _ToastWidget(
            message: message,
            type: type,
            duration: duration,
            onDismissed: () {
              debugPrint('    Dismissing toast');
              overlayEntry..remove()
              ..dispose();
            },
          );
        },
      );

      overlay.insert(overlayEntry);
      debugPrint('    Toast inserted into overlay');
    } catch (e, stackTrace) {
      debugPrint('   Error showing toast: $e');
      debugPrint('   Stack: $stackTrace');
    }
  }

  static void showSuccess(BuildContext context, String message) {
    debugPrint(' showSuccess called');
    show(context, message, type: ToastType.success);
  }

  static void showError(BuildContext context, String message) {
    debugPrint(' showError called');
    show(context, message, type: ToastType.error);
  }

  static void showInfo(BuildContext context, String message) {
    debugPrint('showInfo called');
    show(context, message);
  }
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismissed,
  });

  final String message;
  final ToastType type;
  final Duration duration;
  final VoidCallback onDismissed;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    debugPrint('   Toast widget initState');
    _initAnimations();
    _scheduleAutoDismiss();
  }

  Future<void> _initAnimations() async {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, -1.2),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
          ),
        );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    await _controller.forward();
    debugPrint('    Animation started');
  }

  void _scheduleAutoDismiss() {
    Future.delayed(widget.duration, () async {
      if (mounted) {
        debugPrint('   Auto-dismissing toast');
        await _dismiss();
      }
    });
  }

  Future<void> _dismiss() async {
    await _controller.reverse();
    widget.onDismissed();
  }

  @override
  void dispose() {
    debugPrint('    Toast widget dispose');
    _controller.dispose();
    super.dispose();
  }

  ToastConfig _getConfig(BuildContext context) {
    switch (widget.type) {
      case ToastType.success:
        return ToastConfig(
          color: context.color.button,
          icon: Icons.check_circle_rounded,
        );
      case ToastType.error:
        return const ToastConfig(
          color: Color(0xFFEF4444),
          icon: Icons.error_rounded,
        );
      case ToastType.info:
        return ToastConfig(
          color: context.color.button,
          icon: Icons.info_rounded,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(' Building toast UI');
    final config = _getConfig(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark ? context.color.shades : Colors.white;

    final closeIconColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: isDark
                    ? Border.all(
                        color: Colors.white.withOpacity(0.1),
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 44,
                    decoration: BoxDecoration(
                      color: config.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: config.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      config.icon,
                      color: config.color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: TextStyle(
                        color: context.color.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _dismiss,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: closeIconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToastConfig {
  const ToastConfig({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;
}
