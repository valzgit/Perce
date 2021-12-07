// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..name = fields[0] as String
      ..lastName = fields[1] as String
      ..email = fields[2] as String
      ..phoneNumber = fields[3] as String
      ..userName = fields[4] as String
      ..password = fields[5] as String
      ..buyer = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.buyer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LoggedUserAdapter extends TypeAdapter<LoggedUser> {
  @override
  final int typeId = 1;

  @override
  LoggedUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoggedUser()
      ..name = fields[0] as String
      ..lastName = fields[1] as String
      ..email = fields[2] as String
      ..phoneNumber = fields[3] as String
      ..userName = fields[4] as String
      ..password = fields[5] as String
      ..buyer = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, LoggedUser obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.buyer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 2;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book()
      ..name = fields[0] as String
      ..writer = fields[1] as String
      ..bookUrl = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.writer)
      ..writeByte(2)
      ..write(obj.bookUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserBookRelationAdapter extends TypeAdapter<UserBookRelation> {
  @override
  final int typeId = 3;

  @override
  UserBookRelation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBookRelation()
      ..username = fields[0] as String
      ..bookUrl = fields[1] as String
      ..recommended = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, UserBookRelation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.bookUrl)
      ..writeByte(2)
      ..write(obj.recommended);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBookRelationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
