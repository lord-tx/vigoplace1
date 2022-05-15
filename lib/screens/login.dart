import 'package:flutter/material.dart';
import 'package:vigoplace1/screens/dashboard.dart';
import 'package:vigoplace1/widgets/vigo_button.dart';
import 'package:vigoplace1/widgets/vigo_entry.dart';

import 'signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
        centerTitle: true,
        title: Hero(
            tag: "logo",
            child: Image.asset("assets/images/logo.png")
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: setH(context, 0.03),
              ),
              const Text(
                "Login to continue",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(129, 53, 249, 1)
                ),
              ),
              SizedBox(
                height: setH(context, 0.03),
              ),
              const VigoEntry(
                icon: Icons.account_circle_outlined,
                label: "Username or email address",
              ),
              const VigoEntry(
                icon: Icons.lock,
                label: "Password",
                passwordInput: true,
              ),
              SizedBox(
                height: setH(context, 0.02),
              ),
              VigoButton(
                text: "Login",
                buttonFunction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const Dashboard()));
                },
              ),
              SizedBox(
                height: setH(context, 0.5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Don’t have an account yet?"
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUp()));
                  }, child: Text("Sign up"))
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
