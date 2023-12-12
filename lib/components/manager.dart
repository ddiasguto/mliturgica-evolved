import 'package:signing_mass/pages/Politic/politic_page.dart';
import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PoliticPage()));
      },
    );
  }
}
