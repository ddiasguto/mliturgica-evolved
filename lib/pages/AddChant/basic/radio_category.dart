import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

Categories categories = Categories();

List<Widget> radioCategory = <Widget>[
  RadioElement(category: categories.entrance),
  RadioElement(category: categories.atoPenitencial),
  RadioElement(category: categories.aclamation),
  RadioElement(category: categories.offer),
  RadioElement(category: categories.saint),
  RadioElement(category: categories.comunion),
  RadioElement(category: categories.posComunion),
  RadioElement(category: categories.ending),
  RadioElement(category: categories.holySpirit),
  RadioElement(category: categories.adoration),
  RadioElement(category: categories.mary),
  RadioElement(category: categories.diverse),
];

class RadioElement extends StatelessWidget {
  final String category;

  const RadioElement({super.key, required this.category});

  @override
  Widget build(context) {
    HandleMusic handleMusic = Provider.of(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .45,
      child: ListTile(
        title: Text(
          category == categories.mary ? 'Mariano' : category,
        ),
        leading: Radio<String>(
          value: category,
          groupValue: handleMusic.category,
          onChanged: (String? value) {
            handleMusic.setCategory(value!);
          },
        ),
      ),
    );
  }
}
