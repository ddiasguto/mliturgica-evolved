import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions/navigator.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/CategoryPage/show_list_category.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/provider/Maestro.dart';

Categories categories = Categories();

List<String> list = [
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

class CardHome extends StatelessWidget {
  final String img;
  final int indexCategory;
  const CardHome(this.img, {super.key, required this.indexCategory});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.width * .46,
        child: Card(
          elevation: 5,
          color: primaryColor,
          child: InkWell(
            onTap: () {
              maestro.setIndexCategory(indexCategory);
              maestro.setCategory();
              navigator(context, ShowCategory(category: list[indexCategory]));
            },
            focusColor: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 10),
                Image.asset(
                  'assets/img/$img',
                  width: MediaQuery.of(context).size.width * .3,
                ),
                Text(
                  list[indexCategory].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                QtdChants(category: list[indexCategory]),
                Container(height: 10),
              ],
            ),
          ),
        ));
  }
}

class GenericCard extends StatelessWidget {
  final String category, img;

  const GenericCard(this.category, this.img, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.width * .46,
        child: Card(
          color: primaryColor,
          child: InkWell(
            onTap: () {
              navigator(context, ShowCategory(category: category));
            },
            focusColor: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 10),
                Image.asset(
                  'assets/img/$img',
                  width: MediaQuery.of(context).size.width * .3,
                ),
                Text(
                  category.toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
                QtdChants(category: category),
                Container(height: 10),
              ],
            ),
          ),
        ));
  }
}

class QtdChants extends StatelessWidget {
  const QtdChants({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return StreamBuilder(
        stream: db
            .collection('chants')
            .where('category', isEqualTo: category)
            .where('shared', isEqualTo: true)
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
