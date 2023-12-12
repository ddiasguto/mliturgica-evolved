import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 4, 75, 82);
const redApp = Color.fromARGB(255, 116, 12, 12);
const greenApp = Color.fromARGB(255, 12, 116, 38);
const cyanApp = Color.fromARGB(10, 75, 20, 80);
const gmGreen = Color.fromARGB(255, 36, 49, 37);
const gmGreen2 = Color.fromARGB(255, 255, 255, 255);
const gmGreenLight = Color.fromARGB(120, 36, 49, 37);

class Categories {
  final String entrance = 'Entrada';
  final String atoPenitencial = 'Ato Penitencial';
  final String aclamation = 'Aclamação';
  final String offer = 'Ofertório';
  final String saint = 'Santo';
  final String comunion = 'Comunhão';
  final String posComunion = 'Pós Comunhão';
  final String ending = 'Encerramento';
  final String holySpirit = 'Louvor ao Espírito';
  final String adoration = 'Adoração';
  final String mary = 'Marianos';
  final String diverse = 'Outros';
}

class Chant {
  final String title;
  final String category;
  final List<String> lyrics;
  final String uid;
  final List<String> ciphers;
  final String tone;
  Chant({
    required this.tone,
    required this.lyrics,
    required this.ciphers,
    required this.title,
    required this.category,
    required this.uid,
  });
}
