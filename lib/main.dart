import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple),
        body: Center(
          child: Container(
            child: const Text("hey"),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            color: Colors.lightBlue,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
