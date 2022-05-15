import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigoplace1/screens/dashboard.dart';
import 'package:vigoplace1/screens/onboarding.dart';
import 'package:vigoplace1/utils/main_swatch.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool skip = false;

  @override
  void initState(){
    checkToken();
    super.initState();
  }

  /// Check if the user has a token
  void checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") == null){
      skip = false;
    } else {
      /// Handle Errors.
      skip = true;
      /// Dashboard would be loaded from the helper.
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VigoPlace',
      theme: ThemeData(
        primarySwatch: mainSwatch,
      ),
      home: skip ? const Dashboard() : OnBoarding(),
    );
  }
}
