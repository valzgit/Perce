import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:perce/Routing/route_generator.dart';
import "package:hive_flutter/hive_flutter.dart";

import 'Hive/transaction.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LoggedUserAdapter());
  await Hive.openBox<User>("users");
  await Hive.openBox<LoggedUser>("loggedUser");
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
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
