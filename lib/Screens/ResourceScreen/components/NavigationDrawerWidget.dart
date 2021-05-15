import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vjtiAssistant/constants.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          "Ankit Jaiswal",
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "abjaiswal_b19@ce.vjti.ac.in",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Divider(
                  color: BlackColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Resources",
                  icon: Icons.my_library_books_sharp,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Discussion",
                  icon: Icons.people,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Quiz",
                  icon: Icons.people,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "Logout",
                  icon: Icons.people,
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
                  height: 15,
                ),
                BuildMenuItem(
                  text: "People",
                  icon: Icons.people,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildMenuItem(
                  text: "People",
                  icon: Icons.people,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // color: Color(0xFF59D2FE).withOpacity(0.3),
      ),
      child: ListTile(
        tileColor: Color(0xFF59D2FE).withOpacity(0.2),
        // tileColor: PrimaryColor,

        leading: Icon(
          icon,
          color: Color(0xFFDFD9E2),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            // color: Colors.white,
          ),
        ),
        onTap: () {},
        hoverColor: PrimaryColor,
      ),
    );
  }
}
