import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vjtiAssistant/constants.dart';
import 'components/Logo/Logo.dart';

class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({this.image, this.title, this.description});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<UnbordingContent> contents = [
    UnbordingContent(
        title: 'Resources',
        image: 'assets/icons/resources.svg',
        description:
            "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem Ipsum \nhas been the industry's "),
    UnbordingContent(
        title: 'Online Discussion',
        image: 'assets/icons/online_discussion.svg',
        description:
            "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem Ipsum \nhas been the industry's "),
    UnbordingContent(
        title: 'Teacher\'s Corner',
        image: 'assets/icons/teacher.svg',
        description:
            "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem Ipsum \nhas been the industry's "),
  ];
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
        backgroundColor: Color(0xFFEEF2FE),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: 3,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Logo(),
                        SizedBox(
                          height: 40,
                        ),
                        SvgPicture.asset(
                          contents[i].image,
                          height: size.height * 0.37,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          contents[i].title,
                          style: TextStyle(
                            color: BlackColor,
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BlackColor,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  );
                },
                //       child: Container(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         SizedBox(
                //           height: 50,
                //         ),
                //         Logo(),
                //         SizedBox(
                //           height: 50,
                //         ),
                //         SvgPicture.asset(
                //           "assets/icons/undraw_book_lover_mkck.svg",
                //           height: size.height * 0.37,
                //         ),
                //         SizedBox(
                //           height: 30,
                //         ),
                //         Text(
                //           "Resources",
                //           style: TextStyle(
                //             color: BlackColor,
                //             fontSize: 27,
                //             fontWeight: FontWeight.w600,
                //             fontFamily: 'Poppins',
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text(
                //           "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem Ipsum \nhas been the industry's ",
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             color: BlackColor,
                //             fontSize: 16,
                //             fontFamily: 'Poppins',
                //           ),
                //         ),
                //         Align(
                //           alignment: Alignment.bottomCenter,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: <Widget>[
                //               Container(
                //                 margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                //                 width: 132,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   shape: BoxShape.rectangle,
                //                 ),
                //                 child: Text(
                //                   "Skip",
                //                   style: TextStyle(
                //                     color: PrimaryColor,
                //                     fontSize: 17,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //               ),
                //               Container(
                //                 alignment: Alignment.center,
                //                 margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                //                 width: 132,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   color: PrimaryColor,
                //                   shape: BoxShape.rectangle,
                //                   borderRadius: BorderRadius.only(
                //                     topLeft: Radius.circular(23),
                //                     bottomRight: Radius.circular(23),
                //                     bottomLeft: Radius.circular(23),
                //                     topRight: Radius.circular(23),
                //                   ),
                //                 ),
                //                 child: FlatButton(
                //                   height: 45,
                //                   onPressed: () {},
                //                   child: Text(
                //                     "Next",
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 17,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Row(
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
                      fontSize: 17,
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
                    onPressed: () {
                      if (currentIndex <= 2) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == 2 ? "Started" : "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 10,
        width: currentIndex == index ? 25 : 10,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: PrimaryColor,
        ));
  }
}
