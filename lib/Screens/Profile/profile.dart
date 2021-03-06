import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ResourceScreen/ResourceScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  FirebaseUser user;
  DocumentSnapshot doc;
  Profile(FirebaseUser user, DocumentSnapshot doc) {
    this.user = user;
    this.doc = doc;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      home: EditProfilePage(user, doc),
    );
  }
}

// ignore: must_be_immutable
class EditProfilePage extends StatefulWidget {
  FirebaseUser user;
  DocumentSnapshot doc;

  EditProfilePage(FirebaseUser user, DocumentSnapshot doc){
    this.user = user;
    this.doc = doc;
  }

  @override
  _EditProfilePageState createState() => _EditProfilePageState(user, doc);
}

class _EditProfilePageState extends State<EditProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore databaseReference = Firestore.instance;
  bool showPassword = false;
  bool _isLoading = true;
  final FirebaseUser user;
  DocumentSnapshot doc;

  _EditProfilePageState(this.user, this.doc);


  //     getUser() async {
  //   FirebaseUser fuser = await _auth.currentUser();
  //   await fuser?.reload();
  //   fuser = await _auth.currentUser();
  //   print(fuser.email);
  //   if(fuser != null){
  //     setState(() {
  //       this.user = fuser;
  //       this.uid = fuser.uid;
  //     });
  //   }
  // }

    getUserData() async{
    print("----------------------");
    // await this.getUser();
    print(this.user.uid);
    await databaseReference.collection("Users")
    .document(this.user.uid)
    .get()
    .then((document){
      // print(document);
      this.setState(() {
        this.doc = document;
      });
    });
    print("Hello!");
    print(this.doc.data["UserName"]);
  }



  @override
  void initState() {
    super.initState();
    this.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.purple,
          ),
          onPressed: () {},
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.settings,
        //       color: Colors.green,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (BuildContext context) => SettingsPage()));
        //     },
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://i.pinimg.com/originals/d1/1a/45/d11a452f5ce6ab534e083cdc11e8035e.png",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.purple,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", this.doc.data["UserName"], false, nameController),
              buildTextField("E-mail", this.user.email, false, null),
              buildTextField("Roll Number", "191070040", false, null),
              buildTextField("Branch", "Computer Engineering", false, null),
              buildTextField("SEMESTER", "4", false, null),
              // buildTextField("Password", "********", true),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: deprecated_member_use
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResourceScreen()));
                    },
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () async {
                      try {
                        await this.databaseReference.collection('Users')
                        .document(this.user.uid)
                        .updateData(
                          {
                          "UserName": nameController.text
                          }
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResourceScreen()));
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString(),
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red[100],
                        );
                      }
                      
                    },
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField, TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: _controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    // setState(() {
                    //   showPassword = !showPassword;
                    // });

                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
