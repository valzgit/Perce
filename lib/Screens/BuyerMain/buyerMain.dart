import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/cinzelText.dart';
import 'package:perce/Components/bookimage.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Hive/transaction.dart';

class BuyerMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoggedUser loggedUser = Boxes.loggedUser().get("logged");
    Size size = MediaQuery.of(context).size;
    double unit = size.height / 12;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            //placebo function
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
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/novi_main_screen.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: unit / 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 70,
                ),
                CinzelText(
                  displayText: "PREPORUČENE KNJIGE",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                BookImage(
                  imagename: "harrypotter.png",
                  marginLeft: 80,
                ),
                BookImage(imagename: "hariputer.png"),
                BookImage(imagename: "crimeandpunishment.png"),
              ],
            ),
            SizedBox(
              height: unit / 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 70,
                ),
                CinzelText(
                  displayText: "KNJIGE NA PROMOCIJI",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                BookImage(
                  imagename: "littleprince.jpg",
                  marginLeft: 80,
                ),
                BookImage(imagename: "pinkhobbit.png"),
                BookImage(imagename: "anakarenjina.jpg"),
                BookImage(imagename: "cuprija.png"),
              ],
            ),
            SizedBox(
              height: unit / 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 70,
                ),
                CinzelText(
                  displayText: "SVE KNJIGE",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BookImage(
                    imagename: "stivenhoking.jpg",
                    marginLeft: 80,
                  ),
                  BookImage(imagename: "batman.png"),
                  BookImage(imagename: "cicagorio.jpg"),
                  BookImage(imagename: "divergence.png"),
                  BookImage(imagename: "musketari.png"),
                  BookImage(imagename: "umbertoeco.png"),
                  BookImage(imagename: "staracimore.jpg"),
                  BookImage(imagename: "bracakaramazovi.jpg"),
                  SizedBox(width: 80),
                  InkWell(
                    child: Container(
                      width: 80,
                      height: 70,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/arrow.png"))),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("/allbooks");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
