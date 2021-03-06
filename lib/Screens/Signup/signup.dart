import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final databaseReference = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void createUserRecord(String userName, String uid, String email, String branch, String rollno, int sem) async {
    try {
      await databaseReference.collection("Users")
        .document(uid)
        .setData({
          'UserName': userName,
          'Email': email,
          'uid': uid,
          'Branch': branch,
          'Rollno': rollno,
          'Semester': sem
        });  
      // DocumentReference ref = await databaseReference.collection("Users")
      // .add({
      //   'UserName': userName,
      //   'Email': email,
      //   'uid': uid
      // });
  // print(ref.documentID);
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }

  TextEditingController _email = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _cpass = new TextEditingController();
  TextEditingController _rollno = new TextEditingController();
  // TextEditingController _branch = new TextEditingController();
  TextEditingController _sem = new TextEditingController();
  String branch;

  void signup(String username, String pass, String email, String branch, String rollno, int sem) async {
    try {
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: email, password: pass)).user;
      String uid = user.uid;
      Fluttertoast.showToast(
        msg: "Signing you up!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[800],
        textColor: Colors.white,
        fontSize: 16.0
    );
    createUserRecord(username, uid, user.email, branch, rollno, sem);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error :(",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffF7F7F7),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xff4446F2),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Color(0xff676767),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            labelText: 'Full Name',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          controller: _pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: TextFormField(
                          controller: _cpass,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Confirm Password',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        // child: TextFormField(
                        //   controller: _branch,
                        //   decoration: InputDecoration(
                        //     prefixIcon: Icon(Icons.email),
                        //     labelText: 'Branch',
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     contentPadding: EdgeInsets.all(20.0),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(30.0),
                        //       borderSide: BorderSide(color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                        child: new DropdownButton<String>(
                        value: branch,
                        hint: Text("Please select a branch"),
                        items: <String>['Computer Engineering', 'Information Technology', 'Mechanical Engineering', 'Civil Engineering', 'Electronic Engineering', 'Electronics and Telecommunication'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          this.setState(() {
                            this.branch = val;
                          });
                          print(branch);},
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
                        child: TextFormField(
                          controller: _rollno,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Roll Number',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          controller: _sem,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Semester',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        width: 332.0,
                        height: 70.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff4A8FE7),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                          ),
                          child: Text('Sign Up'),
                          onPressed: (){
                            if(_pass.text != _cpass.text){
                              Fluttertoast.showToast(
                                  msg: "Please retype the confirm password",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            } else{
                              signup(_username.text, _pass.text, _email.text, branch, _rollno.text, int.parse(_sem.text));
                              print("Success!!");
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 60.0),
                        width: 332.0,
                        height: 70.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Color(0xff6767678),
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(50.0)),
                          ),
                          child: Text('Sign up with google'),
                          onPressed: () => print('hi'),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// // ignore: must_be_immutable
// class SignUpScreen extends StatelessWidget {
//   // const SignUpScreen({Key key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
