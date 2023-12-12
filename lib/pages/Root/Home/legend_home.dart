import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class LegendHome extends StatelessWidget {
  final String description;

  @override
  Widget build(context) {
    return Container(
      color: primaryColor,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        description,
        style: const TextStyle(color: Colors.white, fontSize: 10),
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );
  }

  const LegendHome({super.key, required this.description});
}
