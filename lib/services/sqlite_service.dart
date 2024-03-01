import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'dart:async';

final DateFormat formatter = DateFormat('yyyy-MM-dd HH:MM:SS.SSS');
Future<void> saveToDatabase(String valueOfPlate) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create a PlateModel instance
  PlateModel plate = PlateModel(
    numberPlate: valueOfPlate,
    date: DateTime.now(),
  );

  // Open the database
  final database = await openDatabase(
    join(await getDatabasesPath(), 'plates_db.db'),
    onCreate: (db, version) {
      // Create the table when the database is created
      return db.execute(
        'CREATE TABLE plates(id INTEGER PRIMARY KEY AUTOINCREMENT, numberplate TEXT, date TEXT)',
      );
    },
    version: 1,
  );

  // Insert data into the table using the PlateModel instance
  await database.insert(
    'plates',
    plate.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  // Retrieve data from the table and print it
  final List<Map<String, dynamic>> result = await database.query('plates');
  print('Database contents: $result');

  // Close the database
  await database.close();
}

Future<void> clearTable() async {
  final database = await openDatabase(
    join(await getDatabasesPath(), 'plates_db.db'),
    version: 1,
  );

  // Replace 'your_table' with the actual table name
  await database.delete('plates');

  await database.close();
}

Future<void> dropTable() async {
  final database = await openDatabase(
    join(await getDatabasesPath(), 'plates_db.db'),
    version: 1,
  );

  // Replace 'your_table' with the actual table name
  await database.execute('DROP TABLE IF EXISTS plates');

  await database.close();
}

class PlateModel {
  String numberPlate;
  DateTime date;

  PlateModel({
    required this.numberPlate,
    required this.date,
  });

  // Named constructor to create an instance from a map
  PlateModel.fromMap(Map<String, dynamic> map)
      : numberPlate = map['numberplate'],
        date = DateTime.parse(map['date']);

  // Method to convert the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'numberplate': numberPlate,
      'date': date.toIso8601String(),
    };
  }
}
