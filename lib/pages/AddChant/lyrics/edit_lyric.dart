import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

Future<void> editDialog(context, int index, bool edit) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      HandleMusic handleMusic = Provider.of(context);
      String str = edit ? handleMusic.addLyrics[index] : '';
      return AlertDialog(
        title: Text(
          edit
              ? 'Editar verso'.toUpperCase()
              : 'intercalar verso'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
        content: EditableTextField(str: str, index: index),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: <Widget>[
          TextButton(
            child: Text(
              edit ? 'Editar' : 'Adicionar',
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () {
              if (edit) {
                handleMusic.editLyric(index, handleMusic.aux);
              } else {
                handleMusic.putLyric(index + 1, handleMusic.aux);
              }
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class EditableTextField extends StatefulWidget {
  final int index;
  final String str;

  const EditableTextField({
    Key? key,
    required this.index,
    required this.str,
  }) : super(key: key);

  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.str);
  }

  @override
  Widget build(BuildContext context) {
    HandleMusic handleMusic = Provider.of(context);
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(
        labelText: 'Editar:',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        handleMusic.setAux(value);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
