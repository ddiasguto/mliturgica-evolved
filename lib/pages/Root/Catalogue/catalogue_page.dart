import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signing_mass/functions.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Root/Catalogue/leading.dart';
import 'package:signing_mass/pages/Root/Catalogue/title.dart';
import 'package:signing_mass/pages/Root/Catalogue/trailing.dart';
import 'package:signing_mass/pages/ShowMusic/show_music.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    var db = FirebaseFirestore.instance;
    return StreamBuilder(
        stream: db
            .collection('chants')
            .where('shared', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: primaryColor,
                  child: Column(
                    children: [
                      Text(
                        "${snapshot.data!.docs.length} cânticos publicados"
                            .toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (_, index) {
                        Chant chant = Chant(
                            tone: snapshot.data!.docs[index]['tone'],
                            uid: snapshot.data!.docs[index].id,
                            title: snapshot.data!.docs[index]['title'],
                            category: snapshot.data!.docs[index]['category'],
                            lyrics: [],
                            ciphers: []);
                        return Column(
                          children: [
                            ListTile(
                                leading: LeadingCatalogue(
                                  ownerId: snapshot.data!.docs[index]['owner']
                                      .toString(),
                                ),
                                title: TitleCatalogue(title: chant.title),
                                subtitle: Text(
                                  '${chant.category.toUpperCase()} | Tom: ${chant.tone}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: TrailingCatalogue(
                                  uid: chant.uid,
                                ),
                                tileColor: primaryColor,
                                selectedColor: Colors.amberAccent,
                                dense: maestro.shrinkList,
                                onTap: () {
                                  maestro.setSheetFalse();
                                  maestro.setIsMyChants(false);
                                  maestro.setCatalogue(true);
                                  navigator(
                                      context, ShowMusic(sheet: [chant.uid]));
                                }),
                            Container(
                              height: 1,
                              width: MediaQuery.sizeOf(context).width,
                              color: Colors.white,
                            ),
                          ],
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: redApp,
              ),
            );
          }
        });
  }
}
