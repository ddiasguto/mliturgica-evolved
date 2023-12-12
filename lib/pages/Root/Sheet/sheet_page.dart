import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signing_mass/components/check_box.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/pages/Root/Sheet/sheet_elements.dart';

class SheetPage extends StatelessWidget {
  const SheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance.collection('contents');
    Maestro maestro = Provider.of(context);
    int index = maestro.randomQuote;
    return StreamBuilder(
        stream: db.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int length = snapshot.data!.docs.length;
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  navigateThroughSheet(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      generateButton(context),
                      acessShared(context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CheckHymn(),
                      const Text('Incluir hino de louvor'),
                      Container(
                        height: 40,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(children: [
                      Text(
                        '${'"' + snapshot.data!.docs[index % index]['quote']}"',
                        style: const TextStyle(
                          color: redApp,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.docs[index % length]['ref'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: redApp,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                      ),
                    ]),
                  )
                ]);
          }
          return const Center(
              child: CircularProgressIndicator(
            color: redApp,
          ));
        });
  }
}
