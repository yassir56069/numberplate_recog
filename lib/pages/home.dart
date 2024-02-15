import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          onTap: () {},
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
                      onTap: () {},
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
                      onTap: () {},
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

  Future _pickImageFromGallery() async {
    // final returnImage =
    //     await ImagePicker().pickImage(source: ImageSource.gallery);
    // setState(() {});
    return UnimplementedError('soon');
  }
}
