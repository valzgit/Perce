import 'package:flutter/material.dart';

class PerceStartSelect extends StatefulWidget {
  final double width;
  final double height;

  const PerceStartSelect({Key key, this.width, this.height}) : super(key: key);

  @override
  _PerceStartSelectState createState() => _PerceStartSelectState();
}

class _PerceStartSelectState extends State<PerceStartSelect> {
  int lastClickedIndex = 4;
  List<Widget> stars = [];

  @override
  Widget build(BuildContext context) {
    stars = [];
    for (int i = 0; i < 5; ++i) {
      if (i <= lastClickedIndex) {
        stars.add(
          InkWell(
            child: Container(
              width: widget.width/5,
              height: widget.height,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/star.png"))),
            ),
            onTap: () {
              setState(() {
                lastClickedIndex = i;
              });
            },
          ),
        );
      } else {
        stars.add(
          InkWell(
            child: Container(
              width: widget.width/5,
              height: widget.height,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/emptystar.png"))),
            ),
            onTap: () {
              setState(() {
                lastClickedIndex = i;
              });
            },
          ),
        );
      }
      stars.add(SizedBox(width: 5,));
    }

    return Container(
      width: widget.width + 5*5,
      height: widget.height,
      child: Row(children: stars),
    );
  }
}
