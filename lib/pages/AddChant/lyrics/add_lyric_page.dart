import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/pages/AddChant/lyrics/handle_lyrics.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:provider/provider.dart';

var vspace = Container(
  height: 10,
);

class AddLyricPage extends StatelessWidget {
  AddLyricPage({super.key});
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    String str = handleMusic.edit ? 'Editar' : "adicionar";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: primaryColor,
          padding: const EdgeInsets.all(8.0),
          child: Text('2º Passo: $str letra'.toUpperCase(),
              style: const TextStyle(color: Colors.white)),
        ),
        const HandleLyrics()
      ],
    );
  }
}

class InputLyric extends StatefulWidget {
  const InputLyric({Key? key}) : super(key: key);

  @override
  _InputLyricState createState() => _InputLyricState();
}

class _InputLyricState extends State<InputLyric> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Digite o verso e tecle enter',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Preencha este campo';
          }
          return null;
        },
        onFieldSubmitted: (String value) {
          if (_formKey.currentState!.validate()) {
            handleMusic.addLyric(handleMusic.counterLyrics, value);
            handleMusic.incrementCounterLyrics();
            _controller.clear();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
