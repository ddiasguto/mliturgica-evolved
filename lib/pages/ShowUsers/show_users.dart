import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions/shared.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Root/Sheet/route.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/arrow_back.dart';
import 'package:signing_mass/widgets/handle_shrink.dart';
import 'package:text_scroll/text_scroll.dart';

class ShowUsers extends StatelessWidget {
  const ShowUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
          title: Text(
            'Acessar partitura.'.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: [
            const HandleShrink(),
            Container(
              width: 20,
            )
          ],
          elevation: 10,
          automaticallyImplyLeading: false,
          leading: arrowBack(context),
          backgroundColor: primaryColor),
      body: BodyShowUsers(),
    );
  }
}

class BodyShowUsers extends StatelessWidget {
  BodyShowUsers({super.key});
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return StreamBuilder(
        stream: db.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String name = snapshot.data!.docs[index]['name'];
                  String lastName =
                      " " + snapshot.data!.docs[index]['lastName'];
                  if (snapshot.data!.docs[index].id != auth.currentUser!.uid) {
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          tileColor: primaryColor,
                          title: TextScroll(
                            "$name $lastName".toString().toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            velocity: const Velocity(
                              pixelsPerSecond: Offset(15, 0),
                            ),
                            pauseOnBounce: const Duration(seconds: 2),
                            delayBefore: const Duration(seconds: 3),
                          ),
                          subtitle: Text(
                            "${snapshot.data!.docs[index]['team']}"
                                .toString()
                                .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          dense: maestro.shrinkList,
                          onTap: () async {
                            List<String> sheet =
                                await getSheet(snapshot.data!.docs[index].id);
                            if (!context.mounted) return;
                            maestro.setOwnerSheet(name + lastName);
                            maestro.setThirdParty(true);
                            maestro.setSheetTrue();
                            Navigator.pop(context);
                            Navigator.of(context).push(createRoute(sheet));
                          },
                        ),
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
                  } else {
                    return Container();
                  }
                });
          }

          return const Center(
            child: CircularProgressIndicator(color: redApp),
          );
        });
  }
}
