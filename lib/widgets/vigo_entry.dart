import 'package:flutter/material.dart';

class VigoEntry extends StatefulWidget {
  const VigoEntry({Key? key, this.hint, required this.icon, this.passwordInput = false}) : super(key: key);

  final String? hint;
  final IconData icon;
  final bool passwordInput;
  @override
  State<VigoEntry> createState() => _VigoEntryState();
}

class _VigoEntryState extends State<VigoEntry> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(widget.icon),
        fillColor: Colors.black38,
        suffixIcon: widget.passwordInput ? Icon(Icons.remove_red_eye_outlined) : Container(),
      ),
    );
  }
}
