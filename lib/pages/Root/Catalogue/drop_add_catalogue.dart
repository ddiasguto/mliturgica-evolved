import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';

Widget dropAddSheet(context) {
  Maestro maestro = Provider.of(context);
  int index = maestro.indexCatalogue;
  return DropdownButton<int>(
    value: index,
    elevation: 16,
    style: const TextStyle(
      color: Color.fromARGB(255, 116, 12, 12),
    ),
    onChanged: (int? value) {
      maestro.setIndexCatalogue(value!);
    },
    items: [
      DropdownMenuItem<int>(
        value: 0,
        child: Text(
          '  Entrada'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 1,
        child: Text(
          '  Ato Penitencial'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 3,
        child: Text(
          '  Aclamação'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 4,
        child: Text(
          '  Ofertório'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 5,
        child: Text(
          '  Santo'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 6,
        child: Text(
          '  Comunhão'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 7,
        child: Text(
          '  Pós Comunhão'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<int>(
        value: 8,
        child: Text(
          '  Encerramento'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
