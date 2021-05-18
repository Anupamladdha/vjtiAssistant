// Packages
import 'package:flutter/material.dart';

// Screens
import 'Screens/OnBoarding/OnBoardingScreen.dart';
import 'Screens/Login/login.dart';
import 'Screens/Signup/signup.dart';
import 'Screens/Profile/profile.dart';
import 'package:vjtiAssistant/Screens/ResourceScreen/ResourceScreen.dart';
import './Screens/Discussions/Discussions.dart';
void main() {
  runApp(MyApp());
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
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/resources/': (context) => ResourceScreen(),
        '/discussions/': (context) => DiscussionsScreen(),
        // '/profile': (context) => Profile(),
      },
    );
  }
}
