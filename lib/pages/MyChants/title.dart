import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class TitleMyChants extends StatelessWidget {
  const TitleMyChants({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextScroll(
      title.toUpperCase(),
      style: const TextStyle(fontSize: 16, color: Colors.white),
      velocity: const Velocity(
        pixelsPerSecond: Offset(15, 0),
      ),
      pauseOnBounce: const Duration(seconds: 2),
      delayBefore: const Duration(seconds: 3),
    );
  }
}
