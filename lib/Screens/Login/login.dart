import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../HomeScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _isLoading = false;

  // String email;
  // String password;

  chechAuth() async{
    _auth.onAuthStateChanged.listen((user){
      if(user != null){
        print("User is logged in!");
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  login(String email, String password) async {
    if(password.length <= 6){
      print("Password is too small");
      return;
    }
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: email, password: password)) as FirebaseUser;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    this.chechAuth();
  }

  Widget build(BuildContext context) {
    return Container(
      child:
      Scaffold(
        backgroundColor: Color(0xffF7F7F7),
        body: SafeArea(
          child: Container(
            // margin: EdgeInsets.fromLTRB(30, 70, 30, 60),
            padding: EdgeInsets.all(30),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'SIGN IN',
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
                    'Welcome Back!',
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
                          child: Text('Sign In'),
                          onPressed: () => {
                            if(_email.text == '' || _pass.text == ''){
                              print("Please enter valid email and password.")
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
                          child: Text('Sign in with google'),
                          onPressed: () => {
                            
                          },
                        ),
                      ),
                      Container(
                        width: 283,
                        child: Row(
                          children: [
                            Text(
                              'Dont have an account? ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff676767),
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xffE61F1F),
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
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
// class LoginScreen extends StatelessWidget {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   TextEditingController _email = new TextEditingController();
//   TextEditingController _pass = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Color(0xffF7F7F7),
//         body: SafeArea(
//           child: Container(
//             // margin: EdgeInsets.fromLTRB(30, 70, 30, 60),
//             padding: EdgeInsets.all(30),
//             child: ListView(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(bottom: 5.0),
//                   child: Text(
//                     'SIGN IN',
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       color: Color(0xff4446F2),
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 50.0),
//                   child: Text(
//                     'Welcome Back!',
//                     style: TextStyle(
//                       fontSize: 35.0,
//                       color: Color(0xff676767),
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                 ),
//                 Form(
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(bottom: 20.0),
//                         child: TextFormField(
//                           controller: _email,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.email),
//                             labelText: 'Email',
//                             filled: true,
//                             fillColor: Colors.white,
//                             contentPadding: EdgeInsets.all(20.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(bottom: 30.0),
//                         child: TextFormField(
//                           controller: _pass,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock),
//                             labelText: 'Password',
//                             filled: true,
//                             fillColor: Colors.white,
//                             contentPadding: EdgeInsets.all(20.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(bottom: 30.0),
//                         width: 332.0,
//                         height: 70.0,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xff4A8FE7),
//                             onPrimary: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(50.0),
//                             ),
//                           ),
//                           child: Text('Sign In'),
//                           onPressed: () => {
//                             if(_email.text == '' || _pass.text == ''){
//                               print("Please enter valid email and password.")
//                             }
//                           },
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(bottom: 60.0),
//                         width: 332.0,
//                         height: 70.0,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             onPrimary: Color(0xff6767678),
//                             primary: Colors.white,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(50.0)),
//                           ),
//                           child: Text('Sign in with google'),
//                           onPressed: () => {
                            
//                           },
//                         ),
//                       ),
//                       Container(
//                         width: 283,
//                         child: Row(
//                           children: [
//                             Text(
//                               'Dont have an account? ',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 color: Color(0xff676767),
//                                 fontFamily: 'Roboto',
//                               ),
//                             ),
//                             Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 color: Color(0xffE61F1F),
//                                 fontFamily: 'Roboto',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
