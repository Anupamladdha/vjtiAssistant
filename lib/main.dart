import 'package:flutter/material.dart';
import 'Screens/OnBoarding/OnBoardingScreen.dart';
import 'Screens/Login/login.dart';
import 'Screens/Signup/signup.dart';

void main() {
  runApp(Signup());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OnBoardingScreen(),
    );
  }
}
