import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

void snackAdded(context) {
  final snackbar = SnackBar(
    content: const Text('Adicionado.'),
    backgroundColor: Colors.green[800],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void snackAlready(context) {
  const snackbar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text('Este cântico já está na partitura'),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
