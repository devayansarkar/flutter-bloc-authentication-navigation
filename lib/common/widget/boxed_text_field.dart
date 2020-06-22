import 'package:flutter/material.dart';

class BoxedTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool isInputHidden;
  final FocusNode focusNode;
  BoxedTextField(
      {@required this.controller,
      @required this.hint,
      this.isInputHidden = false,
      this.keyboard = TextInputType.text,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black)),
      ),
      controller: controller,
      obscureText: isInputHidden,
      keyboardType: keyboard,
      focusNode: focusNode,
    );
  }
}
