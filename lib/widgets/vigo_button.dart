import 'dart:ui';

import 'package:flutter/material.dart';

class VigoButton extends StatelessWidget {
  const VigoButton({Key? key, this.text, required this.buttonFunction, this.transparent = false}) : super(key: key);

  final String? text;
  final Function buttonFunction;
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      onPressed: (){
        buttonFunction();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 1.5,
          color: transparent ? const Color.fromARGB(255, 129, 53, 249) : Colors.transparent
        )
      ),
      child: Ink(
        decoration: transparent ? BoxDecoration() : const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.center,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 31, 241, 227),
              Color.fromARGB(255, 129, 53, 249),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Center(
            child: Text(
              text ?? "",
              style: TextStyle(
                color: transparent ? const Color.fromARGB(255, 129, 53, 249) : Colors.white
              ),
            ),
          ),
        ),
      ),
      // color: transparent ? Colors.transparent : const Color.fromARGB(1, 129, 53, 249),
    );
  }
}
