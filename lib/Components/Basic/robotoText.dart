import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RobotoText extends StatelessWidget {
  final String displayText;
  final FontWeight fontWeight;
  const RobotoText({
    Key key,
    this.displayText,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: TextStyle(
        color: Colors.white,
        fontWeight: fontWeight,
        fontSize: 30,
        fontFamily: 'Roboto',
      ),
    );
  }
}
