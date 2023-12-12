import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

Widget showNewMusic(context, int index) {
  return const TextScroll(
    'Implementar',
    velocity: Velocity(
      pixelsPerSecond: Offset(10, 0),
    ),
    delayBefore: Duration(seconds: 2),
  );
}
