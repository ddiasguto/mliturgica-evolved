import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/components/delete_chants_dialog.dart';
import 'package:signing_mass/functions.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/add_chant.dart';
import 'package:signing_mass/pages/MyChants/handle_subtitle.dart';
import 'package:signing_mass/pages/MyChants/leading.dart';
import 'package:signing_mass/pages/MyChants/subtitle.dart';
import 'package:signing_mass/pages/MyChants/title.dart';
import 'package:signing_mass/pages/ShowMusic/show_music.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/arrow_back.dart';
import 'package:signing_mass/widgets/handle_shrink.dart';

Categories categories = Categories();

class MyChants extends StatelessWidget {
  MyChants({super.key});
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    Maestro maestro = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: arrowBack(context),
        title: Text(
          'Meus Cânticos'.toUpperCase(),
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: primaryColor,
        actions: [
          handleSubtitle(context),
          const HandleShrink(),
          Container(
            width: 20,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
          stream: db
              .collection('chants')
              .where('owner', isEqualTo: auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) return noData(context);
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (((context, index) {
                    bool visibility = snapshot.data!.docs[index]['shared'];
                    Chant chant = Chant(
                      tone: snapshot.data!.docs[index]['tone'],
                      lyrics: converter(snapshot.data!.docs[index]['lyrics']),
                      ciphers: converter(snapshot.data!.docs[index]['ciphers']),
                      uid: snapshot.data!.docs[index].id,
                      title: snapshot.data!.docs[index]['title'],
                      category: snapshot.data!.docs[index]['category'],
                    );

                    return Column(
                      children: [
                        ListTile(
                            leading: LeadingMyChants(chant: chant),
                            subtitle: SubtitleMyChants(
                                category: chant.category,
                                visible: visibility,
                                tone: chant.tone),
                            dense: maestro.shrinkList,
                            title: TitleMyChants(title: chant.title),
                            iconColor: redApp,
                            tileColor: primaryColor,
                            trailing: SizedBox(
                              width: MediaQuery.sizeOf(context).width * .1,
                              child: Center(
                                child: TextButton(
                                  child: const Icon(
                                    Icons.delete_forever,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    deleteChantDialog(context, chant);
                                  },
                                ),
                              ),
                            ),
                            selectedColor: Colors.white,
                            onTap: () {
                              maestro.setSheetFalse();
                              maestro.setCatalogue(true);
                              maestro.setCurrentChant(chant);
                              handleMusic.setCategory(chant.category);
                              maestro.setIsMyChants(true);
                              navigator(context, ShowMusic(sheet: [chant.uid]));
                            }),
                        Container(
                          height: 1,
                          width: MediaQuery.sizeOf(context).width,
                          color: Colors.white,
                        ),
                        if (index == snapshot.data!.docs.length - 1)
                          Container(
                            height: 100,
                            color: primaryColor,
                          )
                      ],
                    );
                  })));
            } else {
              return const Center(
                  child: CircularProgressIndicator(color: redApp));
            }
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.playlist_add,
            color: primaryColor,
          ),
          onPressed: () {
            handleMusic.setCategory(categories.entrance);
            handleMusic.setIndexTozero();
            handleMusic.emptyMusic();
            navigator(context, const AddChant());
          }),
    );
  }
}

List<String> converter(List<dynamic> list) {
  List<String> aux = [];
  for (int i = 0; i < list.length; i++) {
    aux.add(list[i].toString());
  }
  return aux;
}

Widget noData(context) {
  return const Center(
    child: Text(
      'Sem dados :(',
      style: TextStyle(color: redApp),
    ),
  );
}
