import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

Widget previewInfo(BuildContext context) {
  return Center(
      child: Card(
          elevation: 16,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _myText(context, 'Sem dados para renderizar.'),
          )));
}

Widget _myText(BuildContext context, String str) {
  return Text(
    str,
    style: const TextStyle(color: Colors.white),
  );
}
