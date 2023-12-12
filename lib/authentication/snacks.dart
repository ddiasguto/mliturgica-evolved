import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

void snackWrongPassword(context) {
  const snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text('Senha incorreta'),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void snackNotFound(context) {
  const snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text(
          'Conta não encontrada.\nVerifique os dados.',
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void snackLogOut(context) {
  const snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text(
          'Você saiu de sua conta.',
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void snackRecoverSent(context) {
  const snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text(
          'Verifique sua caixa de entrada',
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  Navigator.pop(context);
}

void snackRegistered(context) {
  final snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning,
          color: redApp,
        ),
        Text(
          'Cliente cadastrado'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    backgroundColor: gmGreen,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  Navigator.pop(context);
}

void snackNotAuthotized(context) {
  const snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text(
          'E-mail não autorizado a realizar cadastro.',
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void snackVerifying(context) {
  const snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: redApp,
        ),
        Text(
          'Verificando e-mail...',
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 197, 187, 96),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  Navigator.pop(context);
}

void snackAddedAuthorization(context) {
  final snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'email autorizado. ',
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(color: Colors.green[800]),
        ),
        Icon(
          Icons.check_circle_sharp,
          color: Colors.green[800],
        ),
      ],
    ),
    backgroundColor: Colors.white70,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  Navigator.pop(context);
}

void snackRegisterEnded(context) {
  final snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Cadastro finalizado.',
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        Icon(
          Icons.check_circle_sharp,
          color: Colors.green[800],
        ),
      ],
    ),
    backgroundColor: Colors.white70,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  Navigator.pop(context);
}
