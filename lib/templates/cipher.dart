import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class Music extends StatelessWidget {
  final String cipher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 10,
      ),
      child: Text(
        cipher.toUpperCase(),
        softWrap: true,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  const Music({super.key, required this.cipher});
}

class Refrao extends StatelessWidget {
  final String cipher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 10),
      child: Text(
        cipher.toUpperCase(),
        softWrap: true,
        style: const TextStyle(color: redApp, fontStyle: FontStyle.italic),
      ),
    );
  }

  const Refrao({super.key, required this.cipher});
}

Widget verse() {
  return Container(
    height: 40,
  );
}

Widget verseCipher() {
  return Container(
    height: 80,
  );
}

class Cifra extends StatelessWidget {
  final String cipher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 22),
      child: Text(
        cipher,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: redApp,
        ),
      ),
    );
  }

  const Cifra({super.key, required this.cipher});
}
