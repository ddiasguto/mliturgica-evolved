import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/ShowMusic/show_music.dart';
import 'package:signing_mass/pages/CategoryPage/add_category.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/pages/Root/Catalogue/fetching_owner_data.dart';
import 'package:text_scroll/text_scroll.dart';

class CategoryBodyPage extends StatelessWidget {
  final String category;
  const CategoryBodyPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context);
    var db = FirebaseFirestore.instance;
    return StreamBuilder(
        stream: db
            .collection('chants')
            .where('shared', isEqualTo: true)
            .where('category', isEqualTo: category)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text(
                'Sem dados...',
                style: TextStyle(color: redApp),
              ));
            }
            return ListView.builder(
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
                          tileColor: primaryColor,
                          leading: SizedBox(
                            width: MediaQuery.sizeOf(context).width * .1,
                            child: TextButton(
                              child: const Icon(
                                Icons.info,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                maestro.setOwnerId(snapshot
                                    .data!.docs[index]['owner']
                                    .toString());
                                showDialog(
                                    context: context, builder: fetchOwnerData);
                              },
                            ),
                          ),
                          title: TextScroll(
                            chant.title.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            velocity: const Velocity(
                              pixelsPerSecond: Offset(15, 0),
                            ),
                            pauseOnBounce: const Duration(seconds: 2),
                            delayBefore: const Duration(seconds: 3),
                          ),
                          subtitle: Text(
                            chant.category.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: SizedBox(
                            width: MediaQuery.sizeOf(context).width * .1,
                            child: TextButton(
                              child: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                maestro.setUid(chant.uid);
                                showDialog(
                                    context: context, builder: addOnCategory);
                              },
                            ),
                          ),
                          selectedColor: Colors.amberAccent,
                          dense: maestro.shrinkList,
                          onTap: () {
                            maestro.setSheetFalse();
                            maestro.setCatalogue(false);
                            maestro.setIsMyChants(false);
                            navigator(
                                context,
                                ShowMusic(
                                  sheet: [chant.uid],
                                ));
                          }),
                      Container(
                        height: 1,
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                      ),
                    ],
                  );
                });
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
