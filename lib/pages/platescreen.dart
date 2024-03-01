import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class PlatesScreen extends StatefulWidget {
  @override
  _PlatesScreenState createState() => _PlatesScreenState();
}

class _PlatesScreenState extends State<PlatesScreen> {
  List<Map<String, dynamic>> platesData = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  Future<void> fetchDataFromDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'plates_db.db'),
      version: 1,
    );

    final List<Map<String, dynamic>> result = await database.query('plates');
    setState(() {
      platesData = result.reversed.toList(); // Reverse the order here
    });

    await database.close();
  }

  Future<void> clearTable() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'plates_db.db'),
      version: 1,
    );

    await database.delete('plates'); // Clear the "plates" table

    // Refresh the data after clearing the table
    fetchDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plates Storage'),
      ),
      body: ListView.builder(
        itemCount: platesData.length,
        itemBuilder: (context, index) {
          final plate = platesData[index];
          final formattedDate = DateFormat('MMMM dd, yyyy hh:mm a')
              .format(DateTime.parse(plate['date']));

          return ListTile(
            title: Text('Number Plate: ${plate['numberplate']}'),
            subtitle: Text(formattedDate),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a confirmation dialog before clearing the table
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Clear Table'),
                content:
                    const Text('Are you sure you want to clear the table?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      clearTable(); // Clear the table
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Clear'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
