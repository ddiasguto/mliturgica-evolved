import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

class SubtitleMyChants extends StatelessWidget {
  final String category;
  final String tone;
  final bool visible;
  const SubtitleMyChants(
      {super.key,
      required this.category,
      required this.visible,
      required this.tone});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return Text(
      maestro.subtitlesMyChant
          ? '${category.toUpperCase()} | Tom: $tone'
          : (visible ? 'Público'.toUpperCase() : 'Privado'.toUpperCase()),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
