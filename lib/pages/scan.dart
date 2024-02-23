import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberplate_recog/pages/home.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 4,
        shadowColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: Ink(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/caret-left.svg',
                colorFilter:
                    const ColorFilter.mode(Color(0xffD3C8D6), BlendMode.srcIn),
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
