import 'package:flutter/cupertino.dart';

class BookImage extends StatelessWidget {
  final String imagename;
  final double marginLeft;
  final double height;
  final double width;
  const BookImage({
    Key key,
    this.imagename,
    this.marginLeft,
    this.height,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(left: marginLeft == null ? 80.00 : marginLeft),
      width: width == null ? 120 : width,
      height: height == null ? 175 : height,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/"+imagename))),
    );
  }
}
