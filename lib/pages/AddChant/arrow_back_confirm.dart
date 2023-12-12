import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/components/snack_bars.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class ArrowBackConfirm extends StatelessWidget {
  const ArrowBackConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return TextButton(
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          if (handleMusic.title.isNotEmpty ||
              handleMusic.addCiphers.isNotEmpty) {
            showDialog(context: context, builder: backConfirm);
          } else {
            Navigator.pop(context);
          }
        });
  }
}

Widget backConfirm(BuildContext context) {
  HandleMusic handleMusic = Provider.of(context);
  return AlertDialog(
    title: Text(
      'Deseja sair?'.toUpperCase(),
      style: const TextStyle(color: redApp, fontSize: 16),
    ),
    content: handleMusic.edit ? editContent(context) : notEditContent(context),
    actionsAlignment: MainAxisAlignment.spaceEvenly,
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text(
            'Sair'.toUpperCase(),
            style: const TextStyle(color: redApp, fontSize: 16),
          )),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar'.toUpperCase(),
            style: TextStyle(color: Colors.blue[600], fontSize: 16),
          ))
    ],
  );
}

Widget notEditContent(BuildContext context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * (1 / 3),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Text('Os dados inseridos serão perdidos.'),
      const Text(
          'Dica: envie o cântico como privado e edite-o em momento oportuno.'),
      Container(
        height: 10,
      ),
      sentPrivateData(context),
    ]),
  );
}

Widget editContent(BuildContext context) {
  return const Text('As alterações serão descartas.');
}

Widget sentPrivateData(BuildContext context) {
  var db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  HandleMusic handleMusic = Provider.of(context);

  return Card(
    color: primaryColor,
    child: InkWell(
      onTap: () {
        var dataChant = <String, dynamic>{
          'category': handleMusic.category,
          'ciphers': handleMusic.addCiphers,
          'counter': 0,
          'lyrics': handleMusic.addLyrics,
          'owner': auth.currentUser!.uid,
          'shared': false,
          'time': 'comum',
          'title': handleMusic.title,
          'tone': handleMusic.tone
        };
        db.collection('chants').doc().set(dataChant).then((value) {
          snackAdded(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Enviar como privado'.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}
