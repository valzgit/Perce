import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/cinzelText.dart';
import 'package:perce/Components/bookImage.dart';
import 'package:perce/Components/Basic/cinzelAutoSizeText.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Hive/transaction.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoggedUser loggedUser = Boxes.loggedUser().get("logged");
    StoredBook storedBook = Boxes.getStoredBooks().get(loggedUser.userName);
    Size size = MediaQuery.of(context).size;
    double unit = size.height / 12;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("/buyermain");
          },
          child: Container(
            width: 230,
            child: Row(
              children: [
                CinzelText(
                  displayText: "Perce",
                  fontSize: 62,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 26,
                  height: 45,
                  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/perce.png"))),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF391D1D),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  actions: [
                    Column(
                      children: [
                        SizedBox(height: 7),
                        PerceButton(
                          color1: Color(0xFF136945),
                          color2: Color(0xFF136945),
                          color3: Color(0xFF136945),
                          text: 'IZMENI NALOG',
                          function: () {
                            Navigator.of(context).popAndPushNamed("/changeuserdata");
                          },
                        ),
                        SizedBox(height: 12),
                        PerceButton(
                          color1: Color(0xFF0E1926),
                          color2: Color(0xFF0E1926),
                          color3: Color(0xFF0E1926),
                          text: 'NAPUSTI NALOG',
                          function: () {
                            Navigator.of(context).popAndPushNamed("/");
                          },
                        ),
                        SizedBox(height: 7)
                      ],
                    ),
                  ],
                  backgroundColor: Color(0xFFF9F6F0),
                ),
              );
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/profile.png"))),
            ),
          ),
          SizedBox(
            width: 35,
          )
        ],
      ),
      body: Container(
        width: size.width,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/plain_background.jpg"))),
        child: Column(
          children: [
            Container(
              height: 70,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookImage(
                  imageUrl: storedBook.bookUrl,
                  height: 455,
                  width: 300,
                ),
                SizedBox(
                  width: 150,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CinzelText(
                      displayText: storedBook.name,
                      color: Colors.black,
                      fontSize: 45,
                    ),
                    Row(children: [
                      CinzelText(
                        displayText: storedBook.writer,
                        color: Colors.black,
                        fontSize: 45,
                      ),
                      SizedBox(width: 120,),
                      CinzelText(
                        displayText: storedBook.placeYear,
                        color: Colors.black,
                        fontSize: 35,
                      ),
                    ]),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 355,
                      width: 1000,
                      child: CinzelAutoSizeText(
                        displayText: storedBook.details,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
