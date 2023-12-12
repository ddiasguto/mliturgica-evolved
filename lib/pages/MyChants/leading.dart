import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/add_chant.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class LeadingMyChants extends StatelessWidget {
  final Chant chant;
  const LeadingMyChants({super.key, required this.chant});

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .1,
      child: Center(
        child: TextButton(
          child: const Icon(
            Icons.edit_document,
            color: Colors.white,
          ),
          onPressed: () {
            handleMusic.setIndexTozero();
            handleMusic.setEditChant(chant);
            handleMusic.setTitle(chant.title);
            navigator(context, const AddChant());
          },
        ),
      ),
    );
  }
}
