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
          color: transparent ? Colors.black : Colors.transparent
        )
      ),
      child: Ink(
        decoration: transparent ? BoxDecoration() : const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Center(
            child: Text(
              text ?? "",
              style: TextStyle(
                color: transparent ? Colors.black : Colors.white
              ),
            ),
          ),
        ),
      ),
      // color: transparent ? Colors.transparent : const Color.fromARGB(1, 129, 53, 249),
    );
  }
}
