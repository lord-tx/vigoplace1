import 'package:flutter/material.dart';
import 'package:vigoplace1/screens/onboarding.dart';
import 'package:vigoplace1/utils/main_swatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: mainSwatch,
      ),
      home: OnBoarding(),
    );
  }
}
