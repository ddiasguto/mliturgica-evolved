import 'package:signing_mass/pages/Root/Home/cards_home.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Root/Home/accessMyChants.dart';

Categories categories = Categories();

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            height: 35,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardHome(indexCategory: 0, "entrance.jpg"),
              CardHome(indexCategory: 1, "penitencia.jpg"),
            ],
          ),
          Container(height: MediaQuery.sizeOf(context).width * (1 / 15)),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardHome(indexCategory: 3, "jesus-sermao-da-montanha.jpg"),
                CardHome(indexCategory: 4, "agnus.png"),
              ]),
          Container(height: MediaQuery.sizeOf(context).width * (1 / 15)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardHome(indexCategory: 5, "saint.jpg"),
              CardHome(indexCategory: 6, "santissimo.jpg"),
            ],
          ),
          Container(height: MediaQuery.sizeOf(context).width * (1 / 15)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardHome(indexCategory: 7, "eucaristia.png"),
              CardHome(indexCategory: 8, "christ_king.jpg"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Diversos'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, color: redApp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const GenericCard('Hino de Louvor', 'agnus1.jpg'),
              GenericCard(categories.holySpirit, 'holy-spirit.png')
            ],
          ),
          Container(height: MediaQuery.sizeOf(context).width * (1 / 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenericCard(categories.adoration, 'agnus1.jpg'),
              GenericCard(categories.mary, 'mary1.png')
            ],
          ),
          Container(
            height: 40,
          ),
          const AccessMyChants(),
        ],
      ),
    );
  }
}
