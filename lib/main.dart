import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Routing/route_generator.dart';
import "package:hive_flutter/hive_flutter.dart";

import 'Hive/transaction.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LoggedUserAdapter());
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox<User>("users");
  await Hive.openBox<LoggedUser>("loggedUser");
  await Hive.openBox<Book>("books");
  final box = Boxes.getUsers();
  final shelf = Boxes.getBooks();
  final buyer = User()
    ..name = "user"
    ..password = "Password123!"
    ..lastName = "user"
    ..userName = "user"
    ..phoneNumber = "64245624624"
    ..email = "user@user.com"
    ..buyer = true;
  final seller = User()
    ..name = "prod"
    ..password = "Password123!"
    ..lastName = "prod"
    ..userName = "prod"
    ..phoneNumber = "46265262356"
    ..email = "prod@prod.com"
    ..buyer = true;
  List<Book> bookList = new List<Book>();
  bookList.add(Book()
    ..name = "Zločin i kazna"
    ..writer = "Fjodor Dostojevski"
    ..bookUrl = "crimeandpunishment.png");
  bookList.add(Book()
    ..name = "Ana Karenjina"
    ..writer = "Lav Tolstoj"
    ..bookUrl = "anakarenjina.jpg");
  bookList.add(Book()
    ..name = "Betmen"
    ..writer = "Bob Kejn"
    ..bookUrl = "batman.png");
  bookList.add(Book()
    ..name = "Braća Karamazovi"
    ..writer = "Fjodor Dostojevski"
    ..bookUrl = "bracakaramazovi.jpg");
  bookList.add(Book()
    ..name = "Čiča Gorio"
    ..writer = "Onore de Balzak"
    ..bookUrl = "cicagorio.jpg");
  bookList.add(Book()
    ..name = "Na Drini ćuprija"
    ..writer = "Ivo Andrić"
    ..bookUrl = "cuprija.png");
  bookList.add(Book()
    ..name = "Divergence"
    ..writer = ""
    ..bookUrl = "divergence.png");
  bookList.add(Book()
    ..name = "Hari Poter i kamen mudrosti"
    ..writer = "J.K. Roulng"
    ..bookUrl = "hariputer.png");
  bookList.add(Book()
    ..name = "Hari Poter i relikvije smrti"
    ..writer = "J. K. Roulng"
    ..bookUrl = "harrypotter.png");
  bookList.add(Book()
    ..name = "Hobit"
    ..writer = "Dž. R. R. Tolkin"
    ..bookUrl = "hobbit.png");
  bookList.add(Book()
    ..name = "Mali princ"
    ..writer = "Sant de Sent Egziperi"
    ..bookUrl = "littleprince.jpg");
  bookList.add(Book()
    ..name = "Tri musketara"
    ..writer = "Aleksandar Dima"
    ..bookUrl = "musketari.png");
  bookList.add(Book()
    ..name = "Starac i more"
    ..writer = "Ernest Hemingvej"
    ..bookUrl = "staracimore.jpg");
  bookList.add(Book()
    ..name = "Teorija svega"
    ..writer = "Stiven Hoking"
    ..bookUrl = "stivenhoking.jpg");
  bookList.add(Book()
    ..name = "Praško groblje"
    ..writer = "Umberto Eko"
    ..bookUrl = "umbertoeco.png");
  box.put("user", buyer);
  box.put("prod", seller);
  bookList.forEach((element) {shelf.put(element.name, element);});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
