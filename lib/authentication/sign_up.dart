import 'package:flutter/material.dart';
import 'package:signing_mass/authentication/end_register.dart';
import 'package:signing_mass/authentication/handle_create_account.dart';
import 'package:signing_mass/models/objects.dart';

class EndRegister extends StatefulWidget {
  const EndRegister({super.key});
  @override
  State<EndRegister> createState() => _EndRegisterState();
}

class _EndRegisterState extends State<EndRegister> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Criar conta:'.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: BodyEndRegister(
          formKey: _formKey,
        ),
        bottomNavigationBar: HandleCreateAccount(
          formKey: _formKey,
        ));
  }
}
