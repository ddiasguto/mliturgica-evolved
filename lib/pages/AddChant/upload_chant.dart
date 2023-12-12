import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/components/snack_bars.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class UploadChant extends StatelessWidget {
  UploadChant({super.key});
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    var docId = handleMusic.edit ? handleMusic.docRef : null;
    var dataChant = <String, dynamic>{
      'category': handleMusic.category,
      'ciphers': handleMusic.addCiphers,
      'counter': 0,
      'lyrics': handleMusic.addLyrics,
      'owner': auth.currentUser!.uid,
      'shared': handleMusic.shared,
      'time': 'comum',
      'title': handleMusic.title,
      'tone': handleMusic.tone
    };
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,
      child: Card(
        color: primaryColor,
        child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enviar cântico  '.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.upload,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            onTap: () {
              db.collection('chants').doc(docId).set(dataChant).then((value) {
                snackAdded(context);
                Navigator.pop(context);
              });
            }),
      ),
    );
  }
}
