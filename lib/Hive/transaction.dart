import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId:0)
class User extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String email;

  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  String userName;

  @HiveField(5)
  String password;

  @HiveField(6)
  bool buyer;
}

@HiveType(typeId:1)
class LoggedUser extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String email;

  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  String userName;

  @HiveField(5)
  String password;

  @HiveField(6)
  bool buyer;
}