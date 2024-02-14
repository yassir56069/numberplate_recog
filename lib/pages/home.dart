import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'NumberPlate Recognition',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontFamily: 'DecimaMonoCyr'),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 4,
          shadowColor: Colors.black,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/garage-car.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xffD3C8D6), BlendMode.srcIn),
              height: 30,
              width: 30,
            ),
          )),
    );
  }
}
