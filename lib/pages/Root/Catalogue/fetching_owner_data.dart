import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:text_scroll/text_scroll.dart';

Widget fetchOwnerData(BuildContext context) {
  Maestro maestro = Provider.of(context);
  var db = FirebaseFirestore.instance;

  CollectionReference collectionReference = db.collection('users');

  return AlertDialog(
      title: Column(
        children: [
          Text(
            'Enviado por:'.toUpperCase(),
            style: const TextStyle(color: Colors.cyan, fontSize: 15),
          ),
          const Divider()
        ],
      ),
      content: FutureBuilder<DocumentSnapshot>(
          future: collectionReference.doc(maestro.ownerID).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.data!.exists) {
                return const Center(
                  child: Text('Sem dados...'),
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextScroll(
                        "${snapshot.data!.get('name').toString().toUpperCase()} ${snapshot.data!.get('lastName').toString().toUpperCase()}",
                        style: const TextStyle(fontSize: 16),
                        velocity: const Velocity(
                          pixelsPerSecond: Offset(15, 0),
                        )),
                    TextScroll(
                        snapshot.data!.get('team').toString().toUpperCase(),
                        style: const TextStyle(fontSize: 16),
                        velocity: const Velocity(
                          pixelsPerSecond: Offset(15, 0),
                        )),
                  ],
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(color: redApp),
              );
            }
          }),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Fechar'.toUpperCase(),
            style: const TextStyle(
                color: Color.fromARGB(255, 116, 12, 12), fontSize: 16),
          ),
        ),
      ]);
}
