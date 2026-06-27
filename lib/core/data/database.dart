import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text().unique()();
  TextColumn get upiId => text().unique()();
  TextColumn get avatarUrl => text().nullable()();
  TextColumn get mpin => text().nullable()();
}

class BankAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get bankName => text()();
  TextColumn get accountNumber => text()();
  TextColumn get ifsc => text()();
  RealColumn get balance => real().withDefault(const Constant(0.0))();
  BoolColumn get isPrimary => boolean().withDefault(const Constant(false))();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get senderId => integer().references(Users, #id).nullable()();
  IntColumn get receiverId => integer().references(Users, #id).nullable()();
  TextColumn get senderName => text()();
  TextColumn get receiverName => text()();
  TextColumn get description => text().nullable()();
  RealColumn get amount => real()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text()();
  TextColumn get type => text()();
  TextColumn get referenceId => text()();
}

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get upiId => text()();
  TextColumn get avatarUrl => text().nullable()();
}

class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get title => text()();
  TextColumn get message => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Users, BankAccounts, Transactions, Contacts, Notifications])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'payclay.sqlite'));
    return NativeDatabase(file);
  });
}
