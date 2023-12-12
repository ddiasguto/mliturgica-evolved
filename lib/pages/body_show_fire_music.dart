import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/templates/cipher.dart';

class BodyShowFireMusic extends StatelessWidget {
  final String id;
  const BodyShowFireMusic(BuildContext context, {super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return FutureBuilder<DocumentSnapshot>(
        future: db.collection('chants').doc(id).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.get('lyrics') != null) {
              List<Widget> lyrics = settingLyrics(snapshot.data!.get('lyrics'));
              return ListView(
                children: lyrics,
              );
            } else {
              return const Center(
                child: Text(
                  'Sem dados :(',
                  style: TextStyle(color: redApp),
                ),
              );
            }
          }

          return const Center(
            child: CircularProgressIndicator(color: redApp),
          );
        });
  }
}

List<Widget> settingLyrics(List lyrics) {
  bool isRefrao = false;
  List<Widget> aux = [];
  for (int i = 0; i < lyrics.length; i++) {
    if (lyrics[i] == "#refrao") {
      isRefrao = !isRefrao;
      aux.add(Container(
        height: 20,
      ));
      continue;
    } else if (lyrics[i] == "#verse") {
      aux.add(Container(
        height: 20,
      ));
      continue;
    }
    Widget widget = isRefrao
        ? Refrao(cipher: lyrics[i].toString())
        : Music(cipher: lyrics[i].toString());
    aux.add(widget);
  }
  return aux;
}
