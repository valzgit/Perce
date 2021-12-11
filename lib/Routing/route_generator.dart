import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perce/Screens/AllBooks/statefulAllBooks.dart';
import 'package:perce/Screens/AllBooks/statefulAllBooksProdavac.dart';
import 'package:perce/Screens/BuyerMain/buyerMain.dart';
import 'package:perce/Screens/EditUserData/editUserData.dart';
import 'package:perce/Screens/Login/login_screen.dart';
import 'package:perce/Screens/Registration/registration_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case '/changeuserdata':
        return MaterialPageRoute(builder: (_) => EditUserDataScreen());
      case '/buyermain':
        return MaterialPageRoute(builder: (_) => BuyerMainScreen());
      case '/allbooks':
        return MaterialPageRoute(builder: (_) => StatefulAllBooksScreen());
      case '/allbooksprodavac':
        return MaterialPageRoute(builder: (_) => StatefulAllBooksProdavacScreen());
      default:
        return _errorRoute();

    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}