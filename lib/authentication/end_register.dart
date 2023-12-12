import 'package:flutter/material.dart';
import 'package:signing_mass/authentication/login.dart';
import 'package:signing_mass/authentication/my_fields.dart';

class BodyEndRegister extends StatelessWidget {
  final formKey;
  const BodyEndRegister({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    var vspace = Container(
      height: 18,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 20),
      child: ListView(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EmailSignUpField(),
                  vspace,
                  const NameField(),
                  vspace,
                  const LastNameField(),
                  vspace,
                  const TeamField(),
                  vspace,
                  const PasswordSignUpField(),
                  vspace,
                  const ConfirmPasswordField(),
                  const HandleShowPassword(
                    colorText: Colors.black,
                    str: 'senhas',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
