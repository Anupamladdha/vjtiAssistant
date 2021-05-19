import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vjtiAssistant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Profile/profile.dart';
import '../../Discussions/Discussions.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String uid;
  String userName;
  DocumentSnapshot doc;
  final databaseReference = Firestore.instance;
  
    getUser() async {
    FirebaseUser fuser = await _auth.currentUser();
    await fuser?.reload();
    fuser = await _auth.currentUser();
    print(fuser.email);
    if(fuser != null){
      setState(() {
        this.user = fuser;
        this.uid = fuser.uid;
      });
    }
  }

   getUserData() async{
    await this.getUser();
    print(this.uid);
    await databaseReference.collection("Users")
    .document(this.uid)
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
    // this.getUser();
    this.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
      child: Material(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the second screen using a named route.
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(this.user, this.doc)));
                          },
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        this.doc != null? Text(
                          this.doc.data["UserName"],
                          style: GoogleFonts.lato(
                            fontSize: 23,
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                          ),
                        ): Text(
                          "Your Username"
                        ),
                        user != null? Text(
                          user.email,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.w600,
                          ),
                        ): Text(
                          "Your Email"
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: BlackColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Resources",
                  icon: Icons.my_library_books_sharp,
                  onpressed: ()=>{
                    Navigator.pushNamed(context, '/resources/')
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/discussions/');
                  },
                    child: BuildMenuItem(
                    text: "Discussions",
                    icon: Icons.people,
                    onpressed: ()=>{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DiscussionsScreen()))
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Quiz",
                  icon: Icons.people,
                  active: true,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    child: BuildMenuItem(
                    text: "Sign Out",
                    icon: Icons.people,
                    onpressed: (){
                      try {
                        FirebaseAuth.instance.signOut();
                        print("Signed out!");                        
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: e.toString(),
                          backgroundColor: Colors.red,
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_LONG
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: BlackColor,
                ),
                const SizedBox(
                  height: 7,
                ),
                BuildMenuItem(
                  text: "Share this app",
                  icon: Icons.share,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Help and Feedback",
                  icon: Icons.help_outline,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}

// class NavigationDrawerWidget extends StatelessWidget {
//   // const NavigationDrawerWidget({Key key}) : super(key: key);
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Material(
//         child: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: Container(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigate to the second screen using a named route.
//                             Navigator.pushNamed(context, '/profile');
//                           },
//                           child: Container(
//                             width: 75,
//                             height: 75,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           "Ankit Jaiswal",
//                           style: GoogleFonts.lato(
//                             fontSize: 25,
//                             color: Color(0xFF707070),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "abjaiswal_b19@ce.vjti.ac.in",
//                           style: GoogleFonts.lato(
//                             fontSize: 15,
//                             color: Color(0xFF707070),
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Divider(
//                   color: BlackColor,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 BuildMenuItem(
//                   text: "Resources",
//                   icon: Icons.my_library_books_sharp,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 BuildMenuItem(
//                   text: "Discussions",
//                   icon: Icons.people,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 BuildMenuItem(
//                   text: "Quiz",
//                   icon: Icons.people,
//                   active: true,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     print("Pressed!");
//                     try {
                      
//                     } catch (e) {
//                     }
//                   },
//                     child: BuildMenuItem(
//                     text: "Sign Out",
//                     icon: Icons.people,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Divider(
//                   color: BlackColor,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 BuildMenuItem(
//                   text: "Share this app",
//                   icon: Icons.share,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 BuildMenuItem(
//                   text: "Help and Feedback",
//                   icon: Icons.help_outline,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    Key key,
    @required this.text,
    @required this.icon,
    this.active = false, 
    this.onpressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool active;
  // ignore: unused_field
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () => {onpressed()},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: this.active
                ? Color(0xFF0070FF).withOpacity(.28)
                : Color(0xFFFFFFFF).withOpacity(0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: this.active ? Color(0xFF0070FF) : Color(0xFF707070),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  text,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: this.active ? Color(0xFF0070FF) : Color(0xFF707070),
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

// class BuildMenuItem extends StatelessWidget {
//   const BuildMenuItem({
//     Key key,
//     @required this.text,
//     @required this.icon,
//   }) : super(key: key);

//   final String text;
//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: ListTile(
//         tileColor: Color(0xFF59D2FE).withOpacity(0.2),
//         leading: Icon(
//           icon,
//           color: Color(0xFFDFD9E2),
//         ),
//         title: Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             // color: Colors.white,
//           ),
//         ),
//         onTap: () {},
//         hoverColor: PrimaryColor,
//       ),
//     );
//   }
// }
