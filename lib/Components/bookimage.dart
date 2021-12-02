import 'package:flutter/cupertino.dart';

class BookImage extends StatelessWidget {
  final String imagename;
  final double marginLeft;
  const BookImage({
    Key key,
    this.imagename,
    this.marginLeft
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(left: marginLeft == null ? 80.00 : marginLeft),
      width: 120,
      height: 175,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/"+imagename))),
    );
  }
}
