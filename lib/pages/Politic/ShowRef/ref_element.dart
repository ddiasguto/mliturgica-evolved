import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class RefElement extends StatelessWidget {
  final String quote;
  final String ref;
  const RefElement({super.key, required this.quote, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              '"$quote"',
              style: const TextStyle(color: redApp),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            Text(
              ref,
              style: const TextStyle(color: redApp),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ]),
        ));
  }
}
