import 'package:flutter/material.dart';
import 'components/NavigationDrawerWidget.dart';

class ResourceScreen extends StatefulWidget {
  ResourceScreen({Key key}) : super(key: key);

  @override
  _ResourceScreenState createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
    );
  }
}