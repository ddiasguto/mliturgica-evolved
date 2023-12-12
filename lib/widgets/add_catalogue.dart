import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/pages/CategoryPage/already_in_sheet.dart';
import 'package:signing_mass/pages/Root/Catalogue/drop_add_catalogue.dart';

Widget addOnCatalogue(context) {
  Maestro maestro = Provider.of(context);
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  return FutureBuilder(
      future: db.collection('users').doc(auth.currentUser!.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<String> sheet = setTarget(snapshot.data!.get('sheet'));
          return AlertDialog(
            title: Text(
              'Adicionar como:'.toUpperCase(),
              style: const TextStyle(color: Colors.cyan, fontSize: 16),
            ),
            content: dropAddSheet(context),
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
                  if (maestro.uid == sheet[maestro.indexCatalogue]) {
                    Navigator.pop(context);
                    showDialog(context: context, builder: alreadyInSheet);
                  } else {
                    sheet[maestro.indexCatalogue] = maestro.uid;
                    var data = <String, dynamic>{'sheet': sheet};
                    db
                        .collection('users')
                        .doc(auth.currentUser!.uid)
                        .update(data);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Adicionar',
                  style: TextStyle(color: Colors.cyan, fontSize: 18),
                ),
              ),
            ],
          );
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
