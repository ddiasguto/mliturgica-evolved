import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions/shared.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/show_music/viewMusic.dart';

Widget fetchingChant(BuildContext context, String id) {
  Maestro maestro = Provider.of(context);
  var db = FirebaseFirestore.instance;
  CollectionReference collection = db.collection('chants');
  return FutureBuilder<DocumentSnapshot>(
      future: collection.doc(id).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.data!.exists) {
            return cannotFetch();
          } else {
            List<String> lyrics = convert(snapshot.data!.get('lyrics'));
            List<String> ciphers = convert(snapshot.data!.get('ciphers'));
            return viewMusic(lyrics, ciphers, maestro.showCipher);
          }
        }
        return const Center(
          child: CircularProgressIndicator(color: redApp),
        );
      });
}

List<String> convert(List<dynamic> aux) {
  List<String> list = [];
  for (int i = 0; i < aux.length; i++) {
    list.add(aux[i].toString());
  }
  return list;
}
