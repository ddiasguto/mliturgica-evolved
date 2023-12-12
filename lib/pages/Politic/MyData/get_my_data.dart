import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class GetMyData extends StatelessWidget {
  const GetMyData({super.key});

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    return FutureBuilder<DocumentSnapshot>(
        future: db.collection('users').doc(auth.currentUser!.uid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                ListTile(
                    leading: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .1,
                      child: const Icon(
                        Icons.person,
                        color: gmGreen,
                      ),
                    ),
                    title: Text(
                        '${snapshot.data!.get('name').toString().trim()} ${snapshot.data!.get('lastName').toString().trim()} ')),
                ListTile(
                    leading: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .1,
                      child: const Icon(
                        Icons.church,
                        color: gmGreen,
                      ),
                    ),
                    title: Text(snapshot.data!.get('team'))),
                ListTile(
                    leading: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .1,
                      child: const Icon(
                        Icons.email,
                        color: gmGreen,
                      ),
                    ),
                    title: Text(snapshot.data!.get('email')))
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(color: redApp),
          );
        }));
  }
}
