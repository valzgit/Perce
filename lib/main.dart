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
  Hive.registerAdapter(UserBookRelationAdapter());
  await Hive.openBox<User>("users");
  await Hive.openBox<LoggedUser>("loggedUser");
  await Hive.openBox<Book>("books");
  await Hive.openBox<UserBookRelation>("userbookrelations");
  final usersBox = Boxes.getUsers();
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
    ..name = "Zlocin i kazna"
    ..writer = "Fjodor Dostojevski"
    ..bookUrl = "crimeandpunishment.png"
    ..promoted = true);
  bookList.add(Book()
    ..name = "Ana Karenjina"
    ..writer = "Lav Tolstoj"
    ..bookUrl = "anakarenjina.jpg"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Betmen"
    ..writer = "Bob Kejn"
    ..bookUrl = "batman.png"
    ..promoted = true);
  bookList.add(Book()
    ..name = "Braca Karamazovi"
    ..writer = "Fjodor Dostojevski"
    ..bookUrl = "bracakaramazovi.jpg"
    ..promoted = true);
  bookList.add(Book()
    ..name = "Cica Gorio"
    ..writer = "Onore de Balzak"
    ..bookUrl = "cicagorio.jpg"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Na Drini cuprija"
    ..writer = "Ivo Andric"
    ..bookUrl = "cuprija.png"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Divergence"
    ..writer = ""
    ..bookUrl = "divergence.png"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Hari Poter i kamen mudrosti"
    ..writer = "J.K. Roulng"
    ..bookUrl = "hariputer.png"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Hari Poter i relikvije smrti"
    ..writer = "J. K. Roulng"
    ..bookUrl = "harrypotter.png"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Hobit"
    ..writer = "Dz. R. R. Tolkin"
    ..bookUrl = "hobbit.png"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Mali princ"
    ..writer = "Sant de Sent Egziperi"
    ..bookUrl = "littleprince.jpg"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Tri musketara"
    ..writer = "Aleksandar Dima"
    ..bookUrl = "musketari.png"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Starac i more"
    ..writer = "Ernest Hemingvej"
    ..bookUrl = "staracimore.jpg"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Teorija svega"
    ..writer = "Stiven Hoking"
    ..bookUrl = "stivenhoking.jpg"
    ..promoted = false);
  bookList.add(Book()
    ..name = "Prasko groblje"
    ..writer = "Umberto Eko"
    ..bookUrl = "umbertoeco.png"
    ..promoted = false);
  usersBox.put("user", buyer);
  usersBox.put("prod", seller);
  bookList.forEach((element) {
    shelf.put(element.bookUrl, element);
  });
  final relations = Boxes.getUserBookRelations();
  relations.put(
      "user",
      UserBookRelation()
        ..username = "user"
        ..bookUrls = ["umbertoeco.png", "littleprince.jpg"]);
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
