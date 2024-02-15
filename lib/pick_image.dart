import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Center(
          child: Stack(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: 100,
                  backgroundImage: MemoryImage(_image!),
                )
              : const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
          Positioned(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.add_a_photo)))
        ],
      )),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
          );
        });
  }
}
