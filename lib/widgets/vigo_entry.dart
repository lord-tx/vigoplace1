import 'package:flutter/material.dart';

class VigoEntry extends StatefulWidget {
  const VigoEntry({Key? key, this.label, required this.icon, this.passwordInput = false, this.hintText, this.eController}) : super(key: key);

  final String? label;
  final String? hintText;
  final IconData icon;
  final TextEditingController? eController;
  // final IconData suffixIcon;
  final bool passwordInput;
  @override
  State<VigoEntry> createState() => _VigoEntryState();
}

class _VigoEntryState extends State<VigoEntry> {

  bool hidePassword = true;

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
        controller: widget.eController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            print('Input cannot be empty');
            return 'Input cannot be empty';
          }
          return null;
        },
        obscureText: widget.passwordInput && hidePassword,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            fontFamily: "Nunito"
          ),
          hintStyle: const TextStyle(
              fontFamily: "Nunito"
          ),
          prefixIcon: Icon(widget.icon),
          hintText: widget.hintText,
          labelText: widget.label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(209, 210, 216, 1)
            )
          ),
          fillColor: Colors.black38,
          suffixIcon: widget.passwordInput ? GestureDetector(
              onTap: (){
                setState(() {
                  hidePassword = hidePassword ? false : true;
                });
              },
              child: hidePassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
          ) : GestureDetector(
            child: const Text(""),
          )
        ),
      ),
    );
  }
}
