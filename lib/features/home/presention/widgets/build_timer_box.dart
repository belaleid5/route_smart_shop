import 'dart:async';
import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class FlashDealTimer extends StatefulWidget {
  final int totalSeconds;

  const FlashDealTimer({super.key, required this.totalSeconds});

  @override
  State<FlashDealTimer> createState() => _FlashDealTimerState();
}

class _FlashDealTimerState extends State<FlashDealTimer> {
  Timer? _timer; 
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.totalSeconds;
    _startCountdown();
  }

  @override
  void didUpdateWidget(covariant FlashDealTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.totalSeconds != widget.totalSeconds) {
      _timer?.cancel();
      _remainingSeconds = widget.totalSeconds;
      _startCountdown();
    }
  }

  void _startCountdown() {
    if (_remainingSeconds <= 0) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
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
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: context.color.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        time,
        style: context.textStyle.copyWith(
          color: context.color.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ':',
        style: TextStyle(
          color: context.color.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}