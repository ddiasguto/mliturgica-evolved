import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/basic/handle_publish.dart';
import 'package:signing_mass/pages/AddChant/basic/radio_category.dart';
import 'package:signing_mass/pages/AddChant/basic/title_field.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class AddChantBasicInfo extends StatelessWidget {
  AddChantBasicInfo({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: primaryColor,
          padding: const EdgeInsets.all(8.0),
          child: Text('1º Passo: Informações básicas'.toUpperCase(),
              style: const TextStyle(color: Colors.white)),
        ),
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TitleField(
                title: handleMusic.title,
              ),
            )),
        Text('   Categoria:'.toUpperCase(),
            style: const TextStyle(color: primaryColor)),
        Expanded(
            child: ListView(
          children: radioCategory,
        )),
        const HandlePublish()
      ],
    );
  }
}

var vspace = Container(
  height: 10,
);
