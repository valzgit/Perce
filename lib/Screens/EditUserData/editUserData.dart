import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/robotoText.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Components/textFieldInput.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Hive/transaction.dart';

class EditUserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoggedUser loggedUser = Boxes.loggedUser().get("logged");
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    double unit = size.width/12;
    double height = 10;
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit:BoxFit.cover,
                image: AssetImage("assets/images/novi_main_screen.jpg")
            )
        ),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              SizedBox(
                width: 3 * unit,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 5 * unit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RobotoText(
                          displayText: "Ime:",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextFieldInput(
                          hintText: "Unesi ime",
                          obscureText: false,
                          initalValue: loggedUser==null?"":loggedUser.name,
                          width: 5 * unit / 2,
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi ime";
                            }
                            loggedUser.name = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    width: 5 * unit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RobotoText(
                          displayText: "Prezime:",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextFieldInput(
                          hintText: "Unesi prezime",
                          obscureText: false,
                          width: 5 * unit / 2,
                          initalValue: loggedUser==null?"":loggedUser.lastName,
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi prezime";
                            }
                            loggedUser.lastName = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    width: 5 * unit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RobotoText(
                          displayText: "Adresa:",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextFieldInput(
                          hintText: "Unesi adresu",
                          obscureText: false,
                          width: 5 * unit / 2,
                          initalValue: loggedUser==null?"":loggedUser.email,
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi email adresu";
                            }
                            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                              return "Adresa je u lo??em formatu";
                            }
                            loggedUser.email = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    width: 5 * unit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RobotoText(
                          displayText: "Kontakt telefon:",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextFieldInput(
                          hintText: "Unesi kontakt telefon",
                          obscureText: false,
                          width: 5 * unit / 2,
                          initalValue: loggedUser==null?"":loggedUser.phoneNumber,
                          validator: (value){
                            bool isNumeric = true;
                            if(value == null) {
                              isNumeric = false;
                            }
                            else isNumeric = double.parse(value, (e) => null) != null;
                            if(value.isEmpty){
                              return "Unesi broj telefona";
                            }
                            if(value.isEmpty || !isNumeric){
                              return "Broj telefona nije u dobrom formatu";
                            }
                            loggedUser.phoneNumber = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    width: 5 * unit,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RobotoText(
                            displayText: "Lozinka:",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextFieldInput(
                            hintText: "Unesi lozinku",
                            obscureText: true,
                            width: 5 * unit / 2,
                            initalValue: loggedUser==null?"":loggedUser.password,
                            validator: (value){
                              if(value.isEmpty){
                                return "Unesi lozinku";
                              }
                              if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                                return "Lozinka je u lo??em formatu";
                              }
                              loggedUser.password = value;
                              return null;
                            },
                          )
                        ]
                    ),
                  ),
                  SizedBox(
                    height: height*2,
                  ),
                  PerceButton(
                    color1: Color(0xFF133069),
                    color2: Color(0xFF133069),
                    color3: Color(0xFF133069),
                    text: 'SA??UVAJ IZMENE',
                    function: (){
                      if(_formKey.currentState.validate()){
                        String userName = loggedUser.userName;
                        final loggedUserBox = Boxes.loggedUser();
                        final userBox = Boxes.getUsers();
                        User user = User()
                          ..name = loggedUser.name
                          ..phoneNumber = loggedUser.phoneNumber
                          ..email = loggedUser.email
                          ..password = loggedUser.password
                          ..userName = loggedUser.userName
                          ..lastName = loggedUser.lastName
                          ..buyer = loggedUser.buyer;
                        userBox.put(userName, user);
                        loggedUserBox.put("logged", loggedUser);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  SizedBox(
                    height: 160,
                  ),
                ],
              ),
              SizedBox(
                width: 4 * unit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

