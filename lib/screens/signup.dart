import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vigoplace1/api/authenticate.dart';
import 'package:vigoplace1/models/user.dart';
import 'package:vigoplace1/screens/dashboard.dart';

import '../widgets/vigo_button.dart';
import '../widgets/vigo_entry.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  /// Get a particular height according to the current MediaQuery
  double setH(context, flex){
    if (flex > 1 ){
      flex = 0.2;
    }
    return MediaQuery.of(context).size.height * flex;
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool checkBoxValue = false;
  bool signUpLoading = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
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
          child: Form(
            key: _formKey,
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
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(129, 53, 249, 1)
                  ),
                ),
                SizedBox(
                  height: setH(context, 0.03),
                ),
                VigoEntry(
                  eController: fullNameController,
                  icon: Icons.account_circle_outlined,
                  label: "Full Name",
                ),
                VigoEntry(
                  eController: usernameController,
                  icon: Icons.alternate_email_outlined,
                  label: "Username",
                ),
                VigoEntry(
                  eController: emailController,
                  icon: Icons.email_outlined,
                  label: "Email Address",
                ),
                VigoEntry(
                  eController: dateOfBirthController,
                  icon: Icons.calendar_today_outlined,
                  hintText: "July 13, 1997",
                ),
                VigoEntry(
                  eController: passwordController,
                  icon: Icons.lock,
                  label: "Password",
                  passwordInput: true,
                ),
                VigoEntry(
                  eController: passwordConfirmController,
                  icon: Icons.lock,
                  label: "Confirm Password",
                  passwordInput: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      onChanged: (bool? value){
                        setState(() {
                          checkBoxValue = value!;
                        });
                      }
                    ),
                    const Text("I agree to the ", style: TextStyle(
                      fontFamily: "Nunito",
                    ),),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center
                      ),
                      onPressed: (){},
                      child: const Text("Terms & Conditions", style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),)
                    ),
                    const Text(" and ", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Nunito",
                    ),),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center
                      ),
                      onPressed: (){},
                      child: const Text("Privacy Policy.", style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),)
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 4),
                  child: signUpLoading ? const CircularProgressIndicator(): VigoButton(
                    text: "Sign up",
                    buttonFunction: () async {
                      if(_formKey.currentState!.validate()){
                        if (passwordController.text == passwordConfirmController.text){
                          /// Manage the button state temporarily
                          /// Provider seemed a bit overkill just for
                          /// bits like this.
                          setState(() {
                            signUpLoading = true;
                          });
                          var createSuccess = await signUp(SignUpUser(
                              fullName    :fullNameController.text,
                              username    :usernameController.text,
                              email       :emailController.text,
                              dateOfBirth :dateOfBirthController.text,
                              password    :passwordController.text
                          ));
                          setState(() {
                            signUpLoading = false;
                          });
                          if (createSuccess["success"]){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> const Dashboard()));
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Account Created"), backgroundColor: Color.fromRGBO(129, 53, 249, 1)));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(createSuccess["message"] ?? ""), backgroundColor: Colors.red,));
                          }
                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match"), backgroundColor: Colors.red,));
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: setH(context, 0.13),
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Already have an account? ", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Nunito",
                    ),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft
                        ),
                        onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (_)=> const Login()));
                      Navigator.pop(context);
                    }, child: const Text("Login", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),))
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
