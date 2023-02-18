import 'package:flutter/material.dart';

class InputFields {

  //TEXTO
  static Widget textInputFormField(
      context, labeText, keyboardType, controller, maxLine, validator) {
    return TextFormField(
      cursorColor: Colors.white70,
      minLines: maxLine,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labeText,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.0))),
    );
  }


}