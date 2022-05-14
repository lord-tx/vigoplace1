import 'package:flutter/material.dart';

import '../widgets/vigo_button.dart';
import 'login.dart';
import 'signup.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/logo.png"),
            Image.asset("assets/images/onboard_image.png"),
            Text(
              "Build connections.",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28
              ),
            ),
            Text("Build wealth.",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28
              ),
            ),
            SizedBox(
              child: Text(
                """Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application."""
              ),
            ),
            VigoButton(
              text: "Login",
              buttonFunction: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Login()));
              },
            ),
            VigoButton(
              text: "SignUp",
              buttonFunction: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> SignUp()));
              },
            )
          ],
        ),
      )
    );
  }
}

