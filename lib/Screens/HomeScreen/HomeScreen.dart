import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Login/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkUser() async {

    _auth.onAuthStateChanged.listen((user){
        if(user == null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }
    });
  }

  getUser() async {
    FirebaseUser user = await _auth.currentUser();
    await user?.reload();
    user = await _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is home screen!"),
    );
  }
}