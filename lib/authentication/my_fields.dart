import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:signing_mass/provider/auth_Provider.dart';

const verify = 'Verificar';

class NameField extends StatelessWidget {
  const NameField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Nome',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo.';
        }
        return null;
      },
      onChanged: (value) {
        authProvider.setName(value);
      },
    );
  }
}

class LastNameField extends StatelessWidget {
  const LastNameField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Sobrenome',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo.';
        }
        return null;
      },
      onChanged: (value) {
        authProvider.setLastName(value);
      },
    );
  }
}

class TeamField extends StatelessWidget {
  const TeamField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Paróquia/Equipe',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo.';
        }
        return null;
      },
      onChanged: (value) {
        authProvider.setTeam(value);
      },
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
        obscureText: !authProvider.showPassword,
        obscuringCharacter: '*',
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
        obscureText: !authProvider.showPassword,
        obscuringCharacter: '*',
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

class EmailSignUpField extends StatelessWidget {
  const EmailSignUpField({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'e-mail',
        ),
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

class LyricField extends StatelessWidget {
  final int index;
  const LyricField({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return SizedBox(
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Título',
        ),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, forneça o título';
          }
          return null;
        },
        onChanged: (value) {
          handleMusic.addLyric(index, value);
        },
      ),
    );
  }
}
