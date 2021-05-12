import 'package:flutter/material.dart';
import 'package:vjtiAssistant/constants.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'VJTI',
          style: TextStyle(
            color: PrimaryColor,
            fontFamily: 'Roboto',
            fontSize: 35,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'e',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'DU',
            ),
            TextSpan(
              text: '.',
              style: TextStyle(
                color: Color(0xFFE61F1F),
                fontWeight: FontWeight.w900,
                fontSize: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
