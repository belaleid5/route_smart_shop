import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class FlashDealTimer extends StatefulWidget {
  final int totalSeconds;

  const FlashDealTimer({super.key, required this.totalSeconds});

  @override
  State<FlashDealTimer> createState() => _FlashDealTimerState();
}

class _FlashDealTimerState extends State<FlashDealTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.totalSeconds;
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant FlashDealTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.totalSeconds != widget.totalSeconds) {
      _timer?.cancel();
      _remainingSeconds = widget.totalSeconds;
      _startTimer();
    }
  }

  void _startTimer() {
    if (_remainingSeconds <= 0) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = Duration(seconds: _remainingSeconds);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildBox(hours),
        _buildDivider(),
        _buildBox(minutes),
        _buildDivider(),
        _buildBox(seconds),
      ],
    );
  }

  Widget _buildBox(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: context.colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        ':',
        style: TextStyle(
          color: context.colors.primary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
