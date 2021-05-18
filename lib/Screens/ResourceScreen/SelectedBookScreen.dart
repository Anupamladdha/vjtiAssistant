import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vjtiAssistant/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedBookScreen extends StatefulWidget {
  @override
  _SelectedBookScreenState createState() => _SelectedBookScreenState();
}

class _SelectedBookScreenState extends State<SelectedBookScreen> {
  int tabValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 50,
        color: Colors.transparent,
        child: FlatButton(
          color: Color(0xFF0070FF),
          onPressed: () {},
          child: Text(
            "Add to Library",
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xFF0070FF).withOpacity(0.28),
                expandedHeight: size.height * 0.5,
                flexibleSpace: Container(
                  height: size.height * 0.5,
                  color: Color(0xFF),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        top: 25,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 62),
                          width: 225,
                          height: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/book2.jpg"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      'Book Name',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: BlackColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14, left: 25),
                    child: Text(
                      'Author name',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 28,
                    margin: EdgeInsets.only(top: 23, bottom: 36),
                    padding: EdgeInsets.only(left: 25),
                    child: DefaultTabController(
                      length: 1,
                      child: TabBar(
                          labelPadding: EdgeInsets.all(0),
                          indicatorPadding: EdgeInsets.all(0),
                          isScrollable: true,
                          labelStyle: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          unselectedLabelStyle: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          indicator: RoundedRectangleTabIndicator(
                            weight: 2,
                            width: 30,
                            color: Color(0xFF4446f2),
                          ),
                          onTap: (value) {
                            setState(() {
                              tabValue = value; 
                            });
                            print(tabValue);
                          },
                          tabs: [
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 39),
                                child: Text('Description'),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 25,
                    ),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesettin",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                        height: 2,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator(
      {@required Color color, @required double weight, @required double width})
      : _painter = _RRectanglePainterColor(color, weight, width);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _RRectanglePainterColor extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;

  _RRectanglePainterColor(Color color, this.weight, this.width)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset customOffset = offset + Offset(0, cfg.size.height - weight);

    //Custom Rectangle
    Rect myRect = customOffset & Size(width, weight);

    // Custom Rounded Rectangle
    RRect myRRect = RRect.fromRectXY(myRect, weight, weight);

    canvas.drawRRect(myRRect, _paint);
  }
}
