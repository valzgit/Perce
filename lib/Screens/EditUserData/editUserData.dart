import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/robotoText.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Components/textFieldInput.dart';

class EditUserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          width: 5 * unit / 2,
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi ime";
                            }
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
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi prezime";
                            }
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
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi email adresu";
                            }
                            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                              return "Adresa je u lošem formatu";
                            }
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
                            validator: (value){
                              if(value.isEmpty){
                                return "Unesi lozinku";
                              }
                              if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                                return "Lozinka je u lošem formatu";
                              }
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
                    text: 'SAČUVAJ IZMENE',
                    function: (){
                      if(_formKey.currentState.validate()){

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

