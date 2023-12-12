import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Politic/ShowRef/ref_element.dart';
import 'package:signing_mass/pages/Politic/ShowRef/show_count.dart';
import 'package:signing_mass/widgets/arrow_back.dart';

class ShowRef extends StatelessWidget {
  const ShowRef({super.key});

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: arrowBack(context),
          backgroundColor: primaryColor,
          title: Text(
            'Referências Bíblicas'.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        body: StreamBuilder(
          stream: db.collection('contents').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return RefElement(
                            quote: snapshot.data!.docs[index]['quote'],
                            ref: snapshot.data!.docs[index]['ref'],
                          );
                        })),
                  ),
                  ShowCount(count: snapshot.data!.docs.length),
                ],
              );
            }
            return const Center(child: RefreshProgressIndicator());
          },
        ));
  }
}
