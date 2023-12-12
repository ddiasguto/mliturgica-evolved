import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/pages/CategoryPage/already_in_sheet.dart';

Widget addOnCategory(context) {
  Maestro maestro = Provider.of(context);
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  return FutureBuilder(
      future: db.collection('users').doc(auth.currentUser!.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<String> sheet = setTarget(snapshot.data!.get('sheet'));
          if (maestro.uid == sheet[maestro.indexCategory]) {
            return alreadyInSheet(context);
          } else {
            return AlertDialog(
              title: const Text(
                'Adicionar à partitura?',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
              content: addToSheetContent(context, sheet[maestro.indexCategory]),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                        color: Color.fromARGB(255, 116, 12, 12), fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    sheet[maestro.indexCategory] = maestro.uid;
                    var data = <String, dynamic>{'sheet': sheet};
                    db
                        .collection('users')
                        .doc(auth.currentUser!.uid)
                        .update(data);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.cyan, fontSize: 18),
                  ),
                ),
              ],
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(color: redApp),
          );
        }
      });
}

List<String> setTarget(List<dynamic> list) {
  List<String> aux = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] == null) {
      aux.add('empty');
    } else {
      aux.add(list[i].toString());
    }
  }
  return aux;
}

Widget addToSheetContent(context, String uid) {
  var db = FirebaseFirestore.instance;
  Maestro maestro = Provider.of(context);

  return SizedBox(
    width: 120,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
                "Cântico de ${maestro.category.toString().toLowerCase()} atual:"),
          ],
        ),
        Container(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: db.collection('chants').doc(uid).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    snapshot.data!.exists
                        ? "\"${snapshot.data!.get('title')}\"".toUpperCase()
                        : "Sem cântico.",
                    style: const TextStyle(
                      color: redApp,
                      fontStyle: FontStyle.italic,
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: redApp),
                );
              },
            )
          ],
        ),
      ],
    ),
  );
}
