import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberplate_recog/main.dart';
import 'package:numberplate_recog/pages/dialog.dart' as dialog;

import 'package:numberplate_recog/pages/platescreen.dart';

import 'package:google_ml_kit/google_ml_kit.dart' as ml;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? _image;
  File? selectedImage;
  ml.InputImage? inputImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: homeGrid(context),
    );
  }

  GridView homeGrid(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children: [
      Container(
        margin: const EdgeInsets.all(30),
        child: InkWell(
          onTap: () {
            showImagePickerOption(context);
            results.clear();
          },
          borderRadius: BorderRadius.circular(20),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SvgPicture.asset(
                    'assets/icons/camera.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xffD3C8D6), BlendMode.srcIn),
                    height: 35,
                    width: 35,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: const Text(
                    'Scan plate',
                    style: TextStyle(
                        fontFamily: 'DecimaMonoCyr',
                        fontSize: 12,
                        color: Color.fromARGB(255, 187, 182, 202)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(30),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlatesScreen()),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SvgPicture.asset(
                    'assets/icons/database.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xffD3C8D6), BlendMode.srcIn),
                    height: 35,
                    width: 35,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: const Text(
                    'View Storage',
                    style: TextStyle(
                        fontFamily: 'DecimaMonoCyr',
                        fontSize: 12,
                        color: Color.fromARGB(255, 187, 182, 202)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  AppBar homeAppBar() {
    return AppBar(
      title: const Text(
        'NumberPlate Recognition',
        style: TextStyle(
            color: Colors.grey, fontSize: 16, fontFamily: 'DecimaMonoCyr'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 4,
      shadowColor: Colors.black,
      automaticallyImplyLeading: false,
    );
  }

  void showImagePickerOption(BuildContext context) {
    results.clear();
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _pickImageFromGallery(context);
                      },
                      child: SizedBox(
                          child: Ink(
                        padding: const EdgeInsets.only(top: 100),
                        child: const Column(
                          children: [
                            Icon(Icons.image, size: 70),
                            Text('Gallery')
                          ],
                        ),
                      )),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _pickImageFromCamera(context);
                      },
                      child: SizedBox(
                          child: Ink(
                        padding: const EdgeInsets.only(top: 100),
                        child: const Column(
                          children: [
                            Icon(Icons.camera_alt, size: 70),
                            Text('Camera')
                          ],
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

// DB

// Gallery
  Future _pickImageFromGallery(BuildContext context) async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      // inputImage = ml.InputImage.fromFile(File(returnImage.path));
      imageToText(context, ml.InputImage.fromFile(File(returnImage.path)));
    });

    if (mounted) {
      Navigator.of(context).pop();
    } else {
      return;
    }
  }

// Camera
  Future _pickImageFromCamera(BuildContext context) async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnImage == null) return;

    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      // inputImage = ml.InputImage.fromFile(File(returnImage.path));
      imageToText(context, ml.InputImage.fromFile(File(returnImage.path)));
    });

    if (mounted) {
      Navigator.of(context).pop();
    } else {
      return;
    }
  }

// OCR
  Future imageToText(
      BuildContext buildContext, ml.InputImage inputImage) async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // prevent the user from dismissing the loading dialog
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    String temp_result = '';
    final textDetector = ml.GoogleMlKit.vision.textRecognizer();
    final ml.RecognizedText recognisedText =
        await textDetector.processImage(inputImage);

    setState(() {
      String text = recognisedText.text;
      for (ml.TextBlock block in recognisedText.blocks) {
        //each block of text/section of text
        final String text = block.text;
        // print("block of text: ");
        results.add(text);
        // print(text);
        for (ml.TextLine line in block.lines) {
          //each line within a text block
          for (ml.TextElement element in line.elements) {
            //each word within a line
            temp_result += element.text + " ";
          }
        }
      }
      // results.add(temp_result);
    });
    int x = 1;
    results.map((textvalue) {
      print("$x. $textvalue");
      x++;
    }).toList();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const dialog.NumplateDialog();
        });
  }
}
