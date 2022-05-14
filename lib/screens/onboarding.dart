import 'package:flutter/material.dart';

import '../widgets/vigo_button.dart';
import 'login.dart';
import 'signup.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  /// Get a particular height according to the current MediaQuery
  double setH(context, flex){
    if (flex > 1 ){
      flex = 0.2;
    }
    return MediaQuery.of(context).size.height * flex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
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
              const Text(
                "Build connections.",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28
                ),
              ),
              const Text("Build wealth.",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28
                ),
              ),
              SizedBox(
                height: setH(context, 0.05),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Text(
                  """Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application.""",
                  textAlign: TextAlign.center,
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
      )
    );
  }
}

