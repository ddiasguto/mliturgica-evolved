import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

Categories categories = Categories();

Widget addSetCategory(context) {
  HandleMusic handleMusic = Provider.of(context);
  return DropdownButton<String>(
    value: handleMusic.category,
    elevation: 16,
    style: const TextStyle(
      color: Color.fromARGB(255, 116, 12, 12),
    ),
    onChanged: (String? value) {
      handleMusic.setCategory(value!);
    },
    items: [
      DropdownMenuItem<String>(
        value: categories.entrance,
        child: Text(
          categories.entrance.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.atoPenitencial,
        child: Text(
          categories.atoPenitencial.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.aclamation,
        child: Text(
          categories.aclamation.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.offer,
        child: Text(
          categories.offer.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.saint,
        child: Text(
          categories.offer.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.comunion,
        child: Text(
          categories.comunion.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.posComunion,
        child: Text(
          categories.posComunion.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      DropdownMenuItem<String>(
        value: categories.ending,
        child: Text(
          categories.ending.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}

Widget dropItem(context, String str) {
  return DropdownMenuItem<String>(
      value: str,
      child: Text(
        str.toUpperCase(),
        style: const TextStyle(fontSize: 16),
      ));
}
