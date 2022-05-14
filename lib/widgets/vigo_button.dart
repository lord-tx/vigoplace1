import 'package:flutter/material.dart';

class VigoButton extends StatelessWidget {
  const VigoButton({Key? key, this.text, required this.buttonFunction, this.transparent = false}) : super(key: key);

  final String? text;
  final Function buttonFunction;
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.05,
      onPressed: (){
        buttonFunction();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(
        text ?? "",
        style: TextStyle(
        ),
      ),
      color: transparent ? Colors.transparent : const Color.fromARGB(1, 129, 53, 249),
    );
  }
}
