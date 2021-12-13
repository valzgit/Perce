import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/textfieldcontainer.dart';

class TextFieldInput extends StatelessWidget {
  final String initalValue;
  final String hintText;
  final bool obscureText;
  final double width;
  final FormFieldValidator<String> validator;
  final int minLines;
  const TextFieldInput({
    Key key,
    this.hintText,
    this.obscureText,
    this.width,
    this.validator,
    this.initalValue,
    this.minLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: width,
      child: TextFormField(
        minLines: minLines == null ? 1 : minLines,
        maxLines: minLines == null ? 1 : minLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: validator,
        initialValue: initalValue==null?"":initalValue,
      ),
    );
  }
}
