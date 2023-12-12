import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/functions/shared.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Root/Sheet/route.dart';
import 'package:signing_mass/pages/ShowUsers/show_users.dart';
import 'package:signing_mass/provider/Maestro.dart';

Widget generateButton(context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * .85 * .5,
    height: 45,
    child: Card(
      elevation: 8,
      color: primaryColor,
      child: InkWell(
        onTap: () {},
        focusColor: Colors.black,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gerar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget acessShared(context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * .85 * .5,
    height: 45,
    child: Card(
      elevation: 8,
      color: primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShowUsers()));
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Acessar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.cloud_sync_outlined,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget navigateThroughSheet(context) {
  Maestro maestro = Provider.of(context);
  var auth = FirebaseAuth.instance;
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * .85,
    height: 45,
    child: Card(
      elevation: 16,
      color: primaryColor,
      child: InkWell(
        onTap: () async {
          List<String> sheet = await getSheet(auth.currentUser!.uid);
          maestro.startSheetStatus();
          if (!maestro.hasHymn) {
            sheet.removeAt(2);
          }
          maestro.setThirdParty(false);
          maestro.setSheetLenght(sheet.length);
          maestro.setIsMyChants(false);
          maestro.setSheetTrue();
          Navigator.of(context).push(createRoute(sheet));
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Navegar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    ),
  );
}
