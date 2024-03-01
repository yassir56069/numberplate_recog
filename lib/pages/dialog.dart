import 'package:flutter/material.dart';
import 'package:numberplate_recog/main.dart';

import 'package:numberplate_recog/services/sqlite_service.dart';

import 'dart:async';

class NumplateDialog extends StatefulWidget {
  const NumplateDialog({super.key});

  @override
  State<NumplateDialog> createState() => _NumplateDialogState();
}

class _NumplateDialogState extends State<NumplateDialog> {
  int _counter = 0;
  int _selected = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return numplateDialog(context);
  }

  AlertDialog numplateDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Text Detected: "),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('ADD AS PLATE'),
          onPressed: () {
            Navigator.of(context).pop();
            saveToDatabase(results[_selected]);
          },
        ),
      ],
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          title: Text(results[index]),
                          value: index,
                          groupValue: _selected,
                          onChanged: (value) {
                            setState(() {
                              _selected = index;
                            });
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return numplateDialog(context);
        });
  }
}
