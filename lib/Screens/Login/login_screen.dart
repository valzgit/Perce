import 'package:flutter/material.dart';
import 'package:perce/Components/Basic/robotoText.dart';
import 'package:perce/Components/perceButton.dart';
import 'package:perce/Components/perceHiperlink.dart';
import 'package:perce/Components/textFieldInput.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double unit = size.width/12;
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit:BoxFit.cover,
            image: AssetImage("assets/images/login_background.jpg")
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
                          displayText: "Korisničko ime:",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextFieldInput(
                          hintText: "Unesi korisničko ime",
                          obscureText: false,
                          width: 5 * unit / 2,
                          validator: (value){
                            if(value.isEmpty){
                              return "Unesi korisničko ime";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  PerceButton(
                    color1: Color(0xFF133069),
                    color2: Color(0xFF133069),
                    color3: Color(0xFF133069),
                    text: 'Prijavi se',
                    function: (){
                      if(_formKey.currentState.validate()){

                      }
                    },
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  PerceHyperlink(
                    text: "Nemaš nalog? Registruj se ovde!",
                    function: (){
                      Navigator.of(context).pushNamed("/registration");
                    },
                  ),
                  SizedBox(
                     height: 60,
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

