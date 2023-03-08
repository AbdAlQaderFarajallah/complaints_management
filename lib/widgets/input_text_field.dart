import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  InputTextField(
      {super.key, this.icon,
      required this.hintText,
      required this.textController});

  late TextEditingController textController;
  IconData? icon;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon:icon==null?null: Icon(icon),
        prefixIconColor: const Color(0xFF6589FF),
        border: const UnderlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
