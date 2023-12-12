import 'package:signing_mass/components/check_box.dart';
import 'package:signing_mass/functions.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/Politic/logout_button.dart';
import 'package:signing_mass/pages/Politic/MyData/my_data.dart';
import 'package:signing_mass/pages/Politic/ShowRef/show_ref.dart';
import 'package:signing_mass/widgets/arrow_back.dart';

class PoliticPage extends StatelessWidget {
  const PoliticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: arrowBack(context),
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text(
            'Informações Adicionais'.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
      body: Column(children: [
        ListTile(
          leading: SizedBox(
              width: MediaQuery.sizeOf(context).width * .1,
              child: const Icon(
                Icons.book,
                color: gmGreen,
              )),
          title: Text(
            'Referências'.toUpperCase(),
            style: const TextStyle(fontSize: 16, color: redApp),
          ),
          onTap: () {
            navigator(context, const ShowRef());
          },
        ),
        ListTile(
          leading: SizedBox(
              width: MediaQuery.sizeOf(context).width * .1,
              child: const Icon(
                Icons.supervised_user_circle,
                color: gmGreen,
              )),
          title: Text(
            'Meus dados'.toUpperCase(),
            style: const TextStyle(fontSize: 16, color: redApp),
          ),
          onTap: () {
            navigator(context, const MyData());
          },
        ),
        const CheckImgHome(),
      ]),
      bottomSheet: const LogoutButton(),
    );
  }
}
