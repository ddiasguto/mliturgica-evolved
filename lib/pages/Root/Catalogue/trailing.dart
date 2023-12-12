import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/widgets/add_catalogue.dart';

class TrailingCatalogue extends StatelessWidget {
  final String uid;
  const TrailingCatalogue({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .1,
      child: TextButton(
        child: const Icon(
          Icons.add_circle,
          color: Colors.white,
        ),
        onPressed: () {
          maestro.setUid(uid);
          showDialog<String>(
            context: context,
            builder: addOnCatalogue,
          );
        },
      ),
    );
  }
}
