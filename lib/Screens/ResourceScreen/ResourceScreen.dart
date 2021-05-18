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

  @override
  Widget build(BuildContext context) {
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
          "Resources",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: BlackColor,
          ),
        ),
      ),
      drawer: NavigationDrawerWidget(),
      body: Body(),
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
          BottomNavyBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("Bookmarks"),
            inactiveColor: Color(0xFF707070),
          ),
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
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            // physics: BouncingScrollPhysics(),
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
                          // fit: BoxFit,
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
                    return InkWell(
                      onTap: () {
                        print("Hii");
                      },
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 19),
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
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      child: Text(
                                        "5.0",
                                        style: GoogleFonts.lato(
                                          color: Color(0xFF707070),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    SizedBox(
                                      child: Icon(
                                        Icons.star_outlined,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Icon(
                                        Icons.star_outlined,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Icon(
                                        Icons.star_outlined,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Icon(
                                        Icons.star_outlined,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Icon(
                                        Icons.star_outlined,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
