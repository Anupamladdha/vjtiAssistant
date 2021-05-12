import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vjtiAssistant/constants.dart';
import 'Logo/Logo.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              "assets/icons/undraw_book_lover_mkck.svg",
              height: size.height * 0.37,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Resources",
              style: TextStyle(
                color: BlackColor,
                fontSize: 23,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem Ipsum \nhas been the industry's ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BlackColor,
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    width: 132,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    width: 132,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23),
                        bottomRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                      ),
                    ),
                    child: FlatButton(
                      height: 45,
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
