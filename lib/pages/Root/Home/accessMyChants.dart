import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/functions/navigator.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/MyChants/MyChants.dart';

class AccessMyChants extends StatelessWidget {
  const AccessMyChants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            dense: true,
            tileColor: primaryColor,
            leading: const Icon(
              Icons.list,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'Meus Cânticos'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            subtitle: _QtdChants(),
            onTap: () {
              navigator(context, MyChants());
            }),
        Container(
            height: 1,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white),
      ],
    );
  }
}

class _QtdChants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;

    return StreamBuilder(
        stream: db
            .collection('chants')
            .where('owner', isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String aux = snapshot.data!.docs.isEmpty
                ? 'Sem cânticos'
                : snapshot.data!.docs.length == 1
                    ? '1 cântico.'
                    : '${snapshot.data!.docs.length} cânticos.';
            return Text(
              aux,
              style: const TextStyle(color: Color.fromARGB(255, 206, 206, 60)),
            );
          }

          return const Text(
            'Carregando...',
            style: TextStyle(color: Colors.white),
          );
        });
  }
}
