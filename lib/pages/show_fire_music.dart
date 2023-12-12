import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/body_show_fire_music.dart';
import 'package:text_scroll/text_scroll.dart';

class ShowFireMusic extends StatelessWidget {
  final Chant chant;
  const ShowFireMusic({super.key, required this.chant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextScroll(
            "${chant.title.toUpperCase()}           ",
            style: const TextStyle(fontSize: 16, color: Colors.white),
            velocity: const Velocity(
              pixelsPerSecond: Offset(15, 0),
            ),
            pauseOnBounce: const Duration(seconds: 2),
            delayBefore: const Duration(seconds: 3),
          ),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: BodyShowFireMusic(
          context,
          id: chant.uid,
        ));
  }
}
