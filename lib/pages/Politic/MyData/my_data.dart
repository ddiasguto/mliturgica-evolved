import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Politic/MyData/get_my_data.dart';
import 'package:signing_mass/widgets/arrow_back.dart';

class MyData extends StatelessWidget {
  const MyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: arrowBack(context),
        title: Text(
          'Meus dados'.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: primaryColor,
      ),
      body: const GetMyData(),
    );
  }
}
