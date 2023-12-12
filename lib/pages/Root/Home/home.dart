import 'package:signing_mass/pages/Root/Home/home_body.dart';
import 'package:signing_mass/pages/Root/Home/home_head.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeHead(),
        HomeBody(),
      ],
    );
  }
}
