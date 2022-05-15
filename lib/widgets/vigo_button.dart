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
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(129, 53, 249, 0.16)
            )
          ],
          color: Color.fromRGBO(129, 53, 249, 1),
          backgroundBlendMode: BlendMode.darken,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            stops: [
              0.001,
              0.05,
              1.0
            ],
            colors: [
              Color.fromRGBO(255, 255, 255, 0.63),
              Color.fromRGBO(31, 241, 227, 0.62),
              Color.fromRGBO(129, 53, 249, 1),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Ink(
          decoration: transparent ? BoxDecoration() : const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(129, 53, 249, 0.16)
              )
            ],
            color: Color.fromRGBO(129, 53, 249, 1),
            backgroundBlendMode: BlendMode.darken,
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [
                0.0,
                0.95
              ],
              colors: [
                Color.fromRGBO(31, 241, 227, 0.0),
                Color.fromRGBO(129, 53, 249, 1),
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
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: transparent ? const Color.fromARGB(255, 129, 53, 249) : Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
      // color: transparent ? Colors.transparent : const Color.fromARGB(1, 129, 53, 249),
    );
  }
}
