import 'package:flutter/material.dart';
import 'package:vigoplace1/api/authenticate.dart';
import 'package:vigoplace1/screens/dashboard.dart';
import 'package:vigoplace1/widgets/vigo_button.dart';
import 'package:vigoplace1/widgets/vigo_entry.dart';

import '../models/user.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// Dummy debug Values
  bool dummyValues = false;

  /// Get a particular height according to the current MediaQuery
  double setH(context, flex){
    if (flex > 1 ){
      flex = 0.2;
    }
    return MediaQuery.of(context).size.height * flex;
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loginLoading = false;

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
              VigoEntry(
                eController: usernameController,
                icon: Icons.account_circle_outlined,
                label: "Username or email address",
              ),
              VigoEntry(
                eController: passwordController,
                icon: Icons.lock,
                label: "Password",
                passwordInput: true,
              ),
              SizedBox(
                height: setH(context, 0.02),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 4),
                child: loginLoading ? const CircularProgressIndicator(): VigoButton(
                  text: "Login",
                  buttonFunction: () async {
                    /// Manage the button state temporarily
                    /// Provider seemed a bit overkill just for
                    /// bits like this.
                    setState(() {
                      loginLoading = true;
                    });
                    var loginSuccess = await login(LoginUser(
                      username: usernameController.text,
                      password: passwordController.text,
                    ));
                    setState(() {
                      loginLoading = false;
                    });
                    if (dummyValues || loginSuccess["success"]){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const Dashboard()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loginSuccess["message"] ?? ""), backgroundColor: Colors.red,));
                    }
                  },
                ),
              ),
              SizedBox(
                height: setH(context, 0.5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Don’t have an account yet?"
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> SignUp()));
                  }, child: const Text("Sign up"))
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
