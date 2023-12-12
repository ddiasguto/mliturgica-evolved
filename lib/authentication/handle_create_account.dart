import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/authentication/snacks.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/auth_Provider.dart';

class HandleCreateAccount extends StatelessWidget {
  final formKey;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  HandleCreateAccount({super.key, this.formKey});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    var userData = <String, dynamic>{
      'lastName': authProvider.lastName,
      'name': authProvider.name,
      'team': authProvider.team,
      'admin': false,
      'email': authProvider.email,
      'sheet': [null, null, 'hymn', null, null, null, null, null, null]
    };

    return Card(
      color: primaryColor,
      child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cadastar'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              auth
                  .createUserWithEmailAndPassword(
                      email: authProvider.email,
                      password: authProvider.password)
                  .then((value) => db
                      .collection('users')
                      .doc(auth.currentUser!.uid)
                      .set(userData))
                  .then((value) => snackRegisterEnded(context));
            }
          }),
    );
  }
}
