import 'package:flutter/material.dart';
import 'package:signing_mass/templates/cipher.dart';

Widget viewMusic(List<String> lyrics, List<String> ciphers, bool showCipher) {
  List<Widget> aux = [];
  for (int i = 0; i < lyrics.length; i++) {
    if (showCipher) {
      aux.add(ciphers[i] == '' ? Container() : Cifra(cipher: ciphers[i]));
    }
    if (lyrics[i].toLowerCase().trim() != '#fim'.toLowerCase().trim()) {
      aux.add(Music(cipher: lyrics[i]));
    } else {
      aux.add(Container(
        height: 40,
      ));
    }
  }
  aux.add(Container(
    height: 60,
  ));
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: aux,
    ),
  ));
}
