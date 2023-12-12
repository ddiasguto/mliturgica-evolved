import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/authentication/components.dart';
import 'package:signing_mass/authentication/login_img.dart';
import 'package:signing_mass/authentication/recover_password.dart';
import 'package:signing_mass/authentication/sign_up.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/auth_Provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                height: 60,
              ),
              LoginImg(context),
              Container(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EmailLoginField(),
                    Container(
                      height: 20,
                    ),
                    const PasswordLoginField(),
                    const HandleShowPassword(
                      colorText: Colors.white,
                      str: 'senha',
                    ),
                    Container(
                      height: 5,
                    ),
                    handleLogin(context, _formKey),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [RecoverWidget(), EndRegisterWidget()],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HandleShowPassword extends StatelessWidget {
  final Color colorText;
  final String str;
  const HandleShowPassword(
      {super.key, required this.colorText, required this.str});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);

    bool isChecked = authProvider.showPassword;
    Color getColor(Set<MaterialState> states) {
      return Colors.white;
    }

    return Row(children: [
      Checkbox(
        checkColor: const Color.fromARGB(255, 0, 125, 255),
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          authProvider.handleShowPassword();
        },
      ),
      Text(
        'Mostrar $str',
        style: TextStyle(fontSize: 16, color: colorText),
      ),
    ]);
  }
}

class RecoverWidget extends StatelessWidget {
  const RecoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecoverPage(),
              ));
        },
        child: const Text(
          'Recuperar Senha',
          style: TextStyle(color: Colors.white),
        ));
  }
}

class EndRegisterWidget extends StatelessWidget {
  const EndRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return TextButton(
        onPressed: () {
          authProvider.showFalse();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EndRegister(),
              ));
        },
        child: const Text(
          'Criar conta',
          style: TextStyle(color: Colors.white),
        ));
  }
}
