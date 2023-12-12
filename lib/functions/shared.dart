import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signing_mass/models/objects.dart';

void persistData(int i, String str) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  switch (i) {
    case 0:
      await prefs.setString('entrance', str);
      break;
    case 1:
      await prefs.setString('penitencial', str);
      break;
    case 3:
      await prefs.setString('aclamacao', str);
      break;
    case 4:
      await prefs.setString('ofertorio', str);
      break;
    case 5:
      await prefs.setString('santo', str);
      break;
    case 6:
      await prefs.setString('comunhao', str);
      break;
    case 7:
      await prefs.setString('poscomunhao', str);
      break;
    case 8:
      await prefs.setString('encerramento', str);
      break;

    default:
  }
}

void setSheetStatus(int i) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('sheetStatus', i);
}

Future<List<String>> getSheet(String uid) async {
  var db = FirebaseFirestore.instance;
  DocumentSnapshot<Map<String, dynamic>> doc =
      await db.collection('users').doc(uid).get();
  List list = doc.get('sheet');
  List<String> aux = [];
  for (int i = 0; i < list.length; i++) {
    aux.add(list[i].toString());
  }
  return aux;
}

Widget cannotFetch() {
  return const Center(
      child: Card(
    elevation: 16,
    color: primaryColor,
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Cântico indisponível.\n O Cântico que deseja acessar foi excluído.',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  ));
}
