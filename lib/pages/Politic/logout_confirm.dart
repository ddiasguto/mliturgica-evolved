import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/authentication/snacks.dart';
import 'package:signing_mass/models/objects.dart';

Widget confirmLogout(context) {
  return AlertDialog(
    content: const SizedBox(
        width: 120,
        child: Text('Tem certeza de que deseja sair de sua conta?')),
    actionsAlignment: MainAxisAlignment.spaceEvenly,
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Cancelar',
          style: TextStyle(color: Colors.cyan[800], fontSize: 18),
        ),
      ),
      TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) => snackLogOut(context));
        },
        child: const Text(
          'Sair',
          style: TextStyle(color: redApp, fontSize: 18),
        ),
      ),
    ],
  );
}
