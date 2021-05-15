import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Login/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggenIn = false;
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkUser() async {

    _auth.onAuthStateChanged.listen((user){
        if(user == null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }
    });
  }

  getUser() async {
    FirebaseUser fuser = await _auth.currentUser();
    await fuser?.reload();
    fuser = await _auth.currentUser();
    if(fuser != null){
      setState(() {
        this.user = fuser;
        this.isLoggenIn = true;
      });
    }

  }

  @override
  void initState() {
    super.initState();
    getUser();
    checkUser();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Welcome, ${user.email}")
      )
    );
  }
}