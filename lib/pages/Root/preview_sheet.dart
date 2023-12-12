import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:text_scroll/text_scroll.dart';

Categories categories = Categories();

List<String> listCategories = [
  categories.entrance,
  categories.atoPenitencial,
  '',
  categories.aclamation,
  categories.offer,
  categories.saint,
  categories.comunion,
  categories.posComunion,
  categories.ending
];

Widget previewChant(BuildContext context) {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  return AlertDialog(
      surfaceTintColor: primaryColor,
      title: Column(
        children: [
          Text(
            'Cânticos na Partitura:'.toUpperCase(),
            style: const TextStyle(color: primaryColor, fontSize: 16),
          ),
          const Divider()
        ],
      ),
      content: FutureBuilder<DocumentSnapshot>(
          future: db.collection('users').doc(auth.currentUser!.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var sheet = snapshot.data!.get('sheet');
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    fetchTitle(sheet[0].toString()),
                    fetchTitle(sheet[1].toString()),
                    fetchTitle(sheet[3].toString()),
                    fetchTitle(sheet[4].toString()),
                    fetchTitle(sheet[5].toString()),
                    fetchTitle(sheet[6].toString()),
                    fetchTitle(sheet[7].toString()),
                    fetchTitle(sheet[8].toString()),
                  ],
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * (1 / 3),
                child: const Center(
                  child: CircularProgressIndicator(color: redApp),
                ),
              );
            }
          }),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            child: Text(
              'OK',
              style: TextStyle(color: Colors.blue[800], fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ]);
}

Widget fetchTitle(String uid) {
  var db = FirebaseFirestore.instance;
  if (uid == '') {
    return Text('Sem Cântico...'.toUpperCase(),
        style: const TextStyle(color: primaryColor, fontSize: 12));
  } else {
    return FutureBuilder<DocumentSnapshot>(
        future: db.collection('chants').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.data!.exists) {
              return Text('Sem Cântico...'.toUpperCase(),
                  style: const TextStyle(color: primaryColor, fontSize: 12));
            } else {
              return TextScroll(
                snapshot.data!.get('title').toUpperCase(),
                style: const TextStyle(fontSize: 12, color: primaryColor),
                velocity: const Velocity(
                  pixelsPerSecond: Offset(15, 0),
                ),
                pauseOnBounce: const Duration(seconds: 2),
                delayBefore: const Duration(seconds: 3),
              );
            }
          }
          return const Text(
            'Carregando...',
            style: TextStyle(color: primaryColor, fontSize: 12),
          );
        });
  }
}

class PreviewChantButton extends StatelessWidget {
  const PreviewChantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      child: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      onTap: () {
        showDialog(context: context, builder: previewChant);
      },
    );
  }
}
