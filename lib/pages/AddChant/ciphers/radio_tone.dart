import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

Categories categories = Categories();

List<Widget> radioTone = <Widget>[
  const RadioElement(tone: 'C'),
  const RadioElement(tone: 'D'),
  const RadioElement(tone: 'E'),
  const RadioElement(tone: 'F'),
  const RadioElement(tone: 'G'),
  const RadioElement(tone: 'A'),
  const RadioElement(tone: 'B'),
];

class RadioElement extends StatelessWidget {
  final String tone;

  const RadioElement({super.key, required this.tone});

  @override
  Widget build(context) {
    HandleMusic handleMusic = Provider.of(context);
    return Column(children: [
      Text(
        tone,
        style: const TextStyle(color: redApp, fontStyle: FontStyle.italic),
      ),
      Radio<String>(
        value: tone,
        groupValue: handleMusic.tone,
        onChanged: (String? value) {
          handleMusic.setTone(value!);
        },
      ),
    ]);
  }
}
