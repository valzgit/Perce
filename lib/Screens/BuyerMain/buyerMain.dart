import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/cinzelText.dart';
import 'package:perce/Components/Basic/robotoText.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Components/perceHiperlink.dart';
import 'package:perce/Components/textFieldInput.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Hive/transaction.dart';

class BuyerMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoggedUser loggedUser = Boxes.loggedUser().get("logged");
    Size size = MediaQuery.of(context).size;
    double unit = size.width / 12;
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
                  builder: (_) => CupertinoAlertDialog(
                        actions: [
                          CupertinoDialogAction(
                            child: const CinzelText(displayText: "IZMENI NALOG"),
                            onPressed: () {
                              Navigator.of(context).popAndPushNamed("/changeuserdata");
                            },
                          ),
                          CupertinoDialogAction(
                            child: const CinzelText(displayText: "NAPUSTI NALOG"),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context).pushNamed("/");
                            },
                          )
                        ],
                      ));
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
        child: Row(
          children: [
            SizedBox(
              width: 3 * unit,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
            SizedBox(
              width: 4 * unit,
            ),
          ],
        ),
      ),
    );
  }
}
