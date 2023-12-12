import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class ShowCount extends StatelessWidget {
  final int count;
  const ShowCount({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count referências'.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
