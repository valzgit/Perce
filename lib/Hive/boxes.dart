import 'package:hive/hive.dart';
import 'package:perce/Hive/transaction.dart';

class Boxes {
  static Box<User> getUsers() => Hive.box<User>('users');
  static Box<LoggedUser> loggedUser() => Hive.box<LoggedUser>('loggedUser');
}