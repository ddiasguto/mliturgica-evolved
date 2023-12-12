import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

Widget showTitle(BuildContext context, String id) {
  var db = FirebaseFirestore.instance;
  CollectionReference collection = db.collection('chants');
  return FutureBuilder<DocumentSnapshot>(
      future: collection.doc(id).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.data!.exists) {
            return const Text(
              'Sem dados...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            );
          } else {
            return TextScroll(
                snapshot.data!.get('title').toString().toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                velocity: const Velocity(
                  pixelsPerSecond: Offset(15, 0),
                ));
          }
        }
        return const Text(
          'Carregando...',
          style: TextStyle(color: Colors.white, fontSize: 16),
        );
      });
}
