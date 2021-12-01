import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CinzelText extends StatelessWidget {
  final String displayText;
  final FontWeight fontWeight;
  final double fontSize;
  const CinzelText({
    Key key,
    this.displayText,
    this.fontWeight,
    this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: TextStyle(
        color: Colors.white,
        fontWeight: fontWeight,
        fontSize: fontSize==null? 30 : fontSize,
        fontFamily: 'Cinzel',
      ),
    );
  }
}
