import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
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
      drawer: NavigationDrawerWidget(),
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
