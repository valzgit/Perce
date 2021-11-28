import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/textfieldcontainer.dart';

class TextFieldInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final double width;
  final FormFieldValidator<String> validator;
  const TextFieldInput({
    Key key,
    this.hintText,
    this.obscureText,
    this.width,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: width,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
