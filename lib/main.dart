import 'package:flutter/material.dart';
import 'package:numberplate_recog/pages/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

List<String> results = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // resetDatabase();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomePage(),
    );
  }

  void resetDatabase() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      join(databasePath, 'plates_db.db'),
      version: 1,
    );

    // Replace 'your_table' with the actual table name
    await database.execute('DROP TABLE IF EXISTS plates');

    // Recreate the table (you might want to modify this based on your table structure)
    await database.execute(
      'CREATE TABLE plates(id INTEGER PRIMARY KEY AUTOINCREMENT, numberplate TEXT, date TEXT)',
    );

    // Close the database
    await database.close();
  }
}
