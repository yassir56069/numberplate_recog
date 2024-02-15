import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberplate_recog/pages/scan.dart';

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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ScanPage()));
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
}
