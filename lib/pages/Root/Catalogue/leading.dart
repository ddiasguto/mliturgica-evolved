import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:signing_mass/pages/Root/Catalogue/fetching_owner_data.dart';

class LeadingCatalogue extends StatelessWidget {
  final String ownerId;

  const LeadingCatalogue({super.key, required this.ownerId});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of(context);
    return TextButton(
      child: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      onPressed: () {
        maestro.setOwnerId(ownerId);
        showDialog(context: context, builder: fetchOwnerData);
      },
    );
  }
}
