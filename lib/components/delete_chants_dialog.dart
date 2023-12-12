import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

Future<void> deleteChantDialog(context, Chant chant) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Confirmar exclusão.',
          style: TextStyle(color: Colors.cyan, fontSize: 18),
        ),
        content: Text(
          'Deseja excluir ${chant.title}?\nEssa ação não pode ser desfeita.',
          softWrap: true,
          style: const TextStyle(color: redApp),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Excluir',
              style: TextStyle(color: redApp, fontSize: 18),
            ),
            onPressed: () {
              deleteChant(chant);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.cyan, fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void deleteChant(Chant chant) {
  final db = FirebaseFirestore.instance;
  db.collection('chants').doc(chant.uid).delete();
}
