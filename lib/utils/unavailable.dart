import 'dart:math';

import 'package:flutter/material.dart';

class Unavailable extends StatelessWidget {
  Unavailable({Key? key}) : super(key: key);

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.functions, size: 150, color: Color.fromRGBO(129, 53, 249, 1)),
            const Text("A Beautiful Page",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black
              )
            ),
            const Text(
              "would be brought to you soon...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
            SizedBox(height: (random.nextInt(100) + 100).toDouble(),),
            Hero(
              tag: "bottomLogo",
              child: Image.asset("assets/images/logo.png")
            )
          ],
        ),
      ),
    );
  }
}
