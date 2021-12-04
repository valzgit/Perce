import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerceCheckBox extends StatefulWidget {
  const PerceCheckBox({Key key}) : super(key: key);

  @override
  _PerceCheckBoxState createState() => _PerceCheckBoxState();
}

class _PerceCheckBoxState extends State<PerceCheckBox> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.green;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool value) {
          setState(
            () {
              isChecked = value;
            },
          );
        },
      ),
    );
  }
}
