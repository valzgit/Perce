import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/cinzelText.dart';
import 'package:perce/Components/bookimage.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Components/perceCheckBox.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Hive/transaction.dart';

class AllBooksBookProdavac extends StatelessWidget {
  final String imageUrl;
  final String writerName;
  final String bookName;
  final bool promoted;

  const AllBooksBookProdavac({Key key, this.imageUrl, this.bookName, this.writerName, this.promoted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoggedUser loggedUser = Boxes.loggedUser().get("logged");
    return Container(
      width: size.width,
      height: 250,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
      child: Row(
        children: [
          BookImage(
            imagename: imageUrl,
            height: 200,
            width: 140,
          ),
          SizedBox(
            width: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CinzelText(
                fontSize: 32,
                displayText: bookName,
                color: Colors.black,
              ),
              SizedBox(
                height: 35,
              ),
              CinzelText(
                fontSize: 32,
                displayText: writerName,
                color: Colors.black,
              )
            ],
          ),
          Spacer(),
          loggedUser.buyer ? Container() : Row(
            children: [
              CinzelText(
                displayText: "PROMOVIŠI:",
                fontSize: 24,
                color: Color(0xFF000000),
              ),
              PerceCheckBox(
                function: () {},
                isChecked: promoted,
              ),
              Container(
                width: 25,
              )
            ],
          ),
          PerceButton(
            text: "DETALJI KNJIGE",
            function: (){},
            color1: Color(0xFF133069),
            color2: Color(0xFF133069),
            color3: Color(0xFF133069),
          ),
          SizedBox(
            width: 65,
          )
        ],
      ),
    );
  }
}
