import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signing_mass/authentication/snacks.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/auth_Provider.dart';

class EmailLoginField extends StatelessWidget {
  const EmailLoginField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        decoration: const InputDecoration(
            prefix: Icon(Icons.email, color: Colors.black),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            hintText: 'E-mail',
            hintStyle: TextStyle(color: Colors.black)),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, forneça o e-mail';
          } else if (!value.contains('@')) {
            return 'Por favor, digite um e-mail válido';
          }

          return null;
        },
        onChanged: (value) {
          authProvider.setEmail(value);
        },
      ),
    );
  }
}

class PasswordLoginField extends StatelessWidget {
  const PasswordLoginField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        obscuringCharacter: '*',
        decoration: const InputDecoration(
          prefix: Icon(Icons.key, color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: 'Senha',
          hintStyle: TextStyle(color: Colors.black),
        ),
        style: const TextStyle(color: Colors.black),
        obscureText: !authProvider.showPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor digite a senha';
          }
          return null;
        },
        onChanged: (value) {
          authProvider.setPassword(value);
        },
      ),
    );
  }
}

Widget handleLogin(context, formKey) {
  AuthProvider authProvider = Provider.of(context);
  return Card(
    color: gmGreen,
    child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fazer Login'.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.login,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
        onTap: () async {
          if (formKey.currentState!.validate()) {
            try {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: authProvider.email,
                password: authProvider.password,
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                snackNotFound(context);
              } else if (e.code == 'wrong-password') {
                snackWrongPassword(context);
              }
            }
          }
        }),
  );
}

Widget handleRecover(context, formKey) {
  AuthProvider authProvider = Provider.of(context);
  return Card(
    color: gmGreen,
    child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recuperar senha'.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        onTap: () async {
          if (formKey.currentState!.validate()) {
            try {
              await FirebaseAuth.instance
                  .sendPasswordResetEmail(email: authProvider.email)
                  .then((value) => snackRecoverSent(context));
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                snackNotFound(context);
              }
            }
          }
        }),
  );
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: gmGreenLight,
      child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Efetuar Logoff  '.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
          onTap: () {
            FirebaseAuth.instance.signOut();
            snackLogOut(context);
          }),
    );
  }
}

class EmailVerifyField extends StatelessWidget {
  const EmailVerifyField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'E-mail',
            hintStyle: TextStyle(color: Colors.white)),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, forneça o e-mail';
          } else if (!value.contains('@')) {
            return 'Por favor, digite um e-mail válido';
          }
          return null;
        },
        onChanged: (value) {
          authProvider.setEmail(value);
        },
      ),
    );
  }
}

class PasswordSignUpField extends StatelessWidget {
  const PasswordSignUpField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Senha',
        ),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor digite a senha';
          }
          return null;
        },
        onChanged: (value) {
          authProvider.setPassword(value);
        },
      ),
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Confirmar senha',
        ),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor confirme a senha';
          } else if (authProvider.password != authProvider.confirmPassword) {
            return 'As senhas não coincidem.';
          }
          return null;
        },
        onChanged: (value) {
          authProvider.setConfirmPassword(value);
        },
      ),
    );
  }
}
