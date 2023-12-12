import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';

class EditableCipherField extends StatefulWidget {
  final int index;
  final String str;

  const EditableCipherField({
    Key? key,
    required this.index,
    required this.str,
  }) : super(key: key);

  @override
  _EditableCipherFieldState createState() => _EditableCipherFieldState();
}

class _EditableCipherFieldState extends State<EditableCipherField> {
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
        hintText: 'Digite a cifra...',
      ),
      style: const TextStyle(color: redApp, fontStyle: FontStyle.italic),
      onChanged: (value) {
        handleMusic.editCipher(widget.index, value);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
