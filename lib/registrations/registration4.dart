import 'package:flutter/material.dart';

class Registration4 extends StatefulWidget {
  Registration4({Key key}) : super(key: key);

  @override
  _Registration4State createState() => _Registration4State();
}

class _Registration4State extends State<Registration4> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: BackgroundPainter(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Container(
              child: Stack(
                children: <Widget>[
                  _title(context),
                  _profileImage(context),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _profileImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .152,
      left: MediaQuery.of(context).size.height * .169,
      child: 
          Container(
            height: 180.0,
            width: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              image: DecorationImage(
                image: ExactAssetImage('assets/profiles/profile.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
        
    );
  }

  _title(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome back to us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Text(
            "Redwalls",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42.0,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color(0xFF06205D);
    canvas.drawPaint(paint);

    Path path1 = Path();
    Paint paint1 = Paint();
    paint1.color = Color(0xFFe45600);

    path1.lineTo(0, 0);
    path1.lineTo(0, size.height * .3);
    path1.quadraticBezierTo(
        size.width / 2, size.height * .5, size.width, size.height * .3);
    path1.lineTo(size.width, 0);

    path1.close();
    canvas.drawPath(path1, paint1);

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Gradient gradient = LinearGradient(
      colors: [
        Color(0xFFf45600),
        Color(0xFFff7600),
      ],
      stops: [.2, .8],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    Paint paint2 = Paint()..shader = gradient.createShader(rect);
    Path path2 = Path();

    path2.lineTo(0, 0);
    path2.lineTo(0, size.height * .15);
    path2.quadraticBezierTo(
        size.width / 2, size.height * .7, size.width, size.height * .15);
    path2.lineTo(size.width, 0);

    path2.close();

    Paint paint3 = Paint();

    paint3.color = Colors.white;

    canvas.drawPath(path2, paint2);

    canvas.drawCircle(Offset(size.width / 2, size.height * .4), 100.0, paint3);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
