import 'package:flutter/material.dart';

import '../widgets/vigo_button.dart';
import 'login.dart';
import 'signup.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  /// Get a particular height according to the current MediaQuery
  double setH(context, flex){
    if (flex > 1 ){
      flex = 0.2;
    }
    return MediaQuery.of(context).size.height * flex;
  }

  final Shader textLinearGradient = const LinearGradient(
    colors: <Color>[Color.fromARGB(127, 31, 241, 227),
      Color.fromARGB(255, 129, 53, 249),],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: "logo",
                  child: Image.asset("assets/images/logo.png")
                ),
                SizedBox(
                  height: setH(context, 0.05),
                ),
                Image.asset("assets/images/onboard_image.png"),
                SizedBox(
                  height: setH(context, 0.05),
                ),
                Text(
                  "Build connections.",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      foreground: Paint()..shader = textLinearGradient,
                  ),
                ),
                Text("Build wealth.",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      foreground: Paint()..shader = textLinearGradient,
                  ),
                ),
                SizedBox(
                  height: setH(context, 0.03),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                    """Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application.""",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: setH(context, 0.03),
                ),
                VigoButton(
                  text: "Login",
                  buttonFunction: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const Login()));
                  },
                ),
                SizedBox(
                  height: setH(context, 0.02),
                ),
                VigoButton(
                  text: "SignUp",
                  buttonFunction: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUp()));
                  },
                  transparent: true,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

