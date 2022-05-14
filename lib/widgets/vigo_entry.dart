import 'package:flutter/material.dart';

class VigoEntry extends StatefulWidget {
  const VigoEntry({Key? key, this.label, required this.icon, this.passwordInput = false, this.hintText}) : super(key: key);

  final String? label;
  final String? hintText;
  final IconData icon;
  // final IconData suffixIcon;
  final bool passwordInput;
  @override
  State<VigoEntry> createState() => _VigoEntryState();
}

class _VigoEntryState extends State<VigoEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 244, 248),
        borderRadius: BorderRadius.circular(4)
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          hintText: widget.hintText,
          labelText: widget.label,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(209, 210, 216, 1)
            )
          ),
          fillColor: Colors.black38,
          suffixIcon: widget.passwordInput ? const Icon(Icons.remove_red_eye_outlined) : Icon(Icons.remove_red_eye_outlined, color: Colors.transparent,)
        ),
      ),
    );
  }
}
