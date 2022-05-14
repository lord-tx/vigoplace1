import 'package:flutter/material.dart';

import '../widgets/vigo_button.dart';
import '../widgets/vigo_entry.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
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
                "Sign up to gain access",
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
                label: "Full Name",
              ),
              const VigoEntry(
                icon: Icons.alternate_email_outlined,
                label: "Username",
              ),
              const VigoEntry(
                icon: Icons.email_outlined,
                label: "Email Address",
              ),
              const VigoEntry(
                icon: Icons.calendar_today_outlined,
                hintText: "July 13, 1997",
              ),
              const VigoEntry(
                icon: Icons.lock,
                label: "Password",
                passwordInput: true,
              ),
              const VigoEntry(
                icon: Icons.lock,
                label: "Confirm Password",
                passwordInput: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (bool? value){}),
                  Text("I agree to the "),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center
                    ),
                    onPressed: (){},
                    child: Text("Terms & Conditions", style: TextStyle(
                      fontSize: 14
                    ),)
                  ),
                  Text(" and "),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center
                    ),
                    onPressed: (){},
                    child: Text("Privacy Policy.")
                  ),
                ],
              ),
              VigoButton(
                text: "Sign up",
                buttonFunction: (){},
              ),
              SizedBox(
                height: setH(context, 0.13),
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Already have an account?"
                  ),
                  TextButton(onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=> const Login()));
                    Navigator.pop(context);
                  }, child: Text("Login"))
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
