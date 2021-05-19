import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vjtiAssistant/constants.dart';
import 'components/NavigationDrawerWidget.dart';

class ResourceScreen extends StatefulWidget {
  ResourceScreen({Key key}) : super(key: key);

  @override
  _ResourceScreenState createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  int currentIndex = 0;
  List listOfTitles = ["Resources", "Add New Book", "My Library"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List listOfSections = [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // width: 270,
                      width: size.width * 0.7,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          hintText: "Search",
                          suffixIcon: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: SizedBox(
                              child: Icon(Icons.search),
                              height: 18,
                            ),
                          ),
                          // textStyle: GoogleFonts.lato(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: BlackColor,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: BlackColor,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 30,
                      child: SvgPicture.asset(
                        "assets/icons/filter.svg",
                        height: 40,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 22),
                  child: Text(
                    "Books you may like...",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Color(0xFF262828),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 22),
                  height: 220,
                  child: ListView.builder(
                    itemCount: 10,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 170,
                        width: 140,
                        margin: EdgeInsets.only(right: 19),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/book2.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 22),
                  child: Text(
                    "All Books",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Color(0xFF262828),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ListView.builder(
                    padding: EdgeInsets.only(top: 25),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 19),
                        child: InkWell(
                          onTap: () {
                            print("Hii");
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 81,
                            width: size.width - 50,
                            // color: Color(0xFFF7F7F7),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 81,
                                  width: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/book2.jpg"),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Book Name",
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Author Name",
                                      style: GoogleFonts.lato(
                                        color: Color(0xFF707070),
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      Container(
        // TODO: Add a book UI
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Add a Book",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(" Book Name", "Engineering Mechanics", false),
              buildTextField(" Book Author", "MD Dayal", false),
              buildTextField(" Semester", "4", false),
              buildTextField(" Branch", "Computer Engineering", false),
              buildTextField(" Subject", "Engineering Mechanics", false),
              RaisedButton(
                onPressed: () {},
                color: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.drive_folder_upload),
                    Text(
                      " UPLOAD A PDF",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
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
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "ADD BOOK",
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
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
            padding: EdgeInsets.only(top: 25),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 19),
                child: InkWell(
                  onTap: () {
                    print("Hii");
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 81,
                    width: size.width - 50,
                    // color: Color(0xFFF7F7F7),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 81,
                          width: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage("assets/images/book2.jpg"),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 21,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Book Name",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Author Name",
                              style: GoogleFonts.lato(
                                color: Color(0xFF707070),
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          listOfTitles[currentIndex],
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: BlackColor,
          ),
        ),
      ),
      drawer: NavigationDrawerWidget(),
      body: listOfSections[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.search_sharp),
            title: Text("Discover"),
            inactiveColor: Color(0xFF707070),
          ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.bookmark),
          //   title: Text("Bookmarks"),
          //   inactiveColor: Color(0xFF707070),
          // ),
          BottomNavyBarItem(
            icon: Icon(Icons.add),
            title: Text("Add book"),
            inactiveColor: Color(0xFF707070),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.library_books),
            title: Text("My Library"),
            inactiveColor: Color(0xFF707070),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        // obscureText: isPasswordTextField ? showPassword : false,

        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
          ),
          contentPadding: EdgeInsets.all(10),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
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
