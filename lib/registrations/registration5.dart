import 'package:flutter/material.dart';

class Registration5 extends StatefulWidget {
  Registration5({Key key}) : super(key: key);

  @override
  _Registration5State createState() => _Registration5State();
}

class _Registration5State extends State<Registration5> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: BackgroundPainter(),
          child: Container(),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(),
        ),
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(size.width - (size.width * .1), size.height * .1);
    Offset offsetSide = Offset(-(size.width * .3), size.height * .75);

    // Background Color
    Paint paintBG = Paint()..color = Colors.grey.shade900;
    canvas.drawPaint(paintBG);

    // Paint 3
    Paint paint3 = Paint();
    Gradient gradient3 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE33F0A),
        Color(0xFFE6156E),
      ],
      stops: [.3, .4],
    );

    Rect rect3 = Rect.fromLTWH(0, 0, size.width, size.height);
    paint3.shader = gradient3.createShader(rect3);

    double radius3 = 400.0;
    Path path3 = Path();
    path3.addOval(Rect.fromCircle(center: offset, radius: radius3 + 5));
    canvas.drawShadow(path3, Colors.black54.withOpacity(.2), 8.0, true);
    canvas.drawCircle(offset, radius3, paint3);

    // Paint Side 2
    Paint paintSide2 = Paint();
    Gradient gradientSide2 = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFF06234),
        Color(0xFFFF65A5),
      ],
      stops: [.4, .8],
    );

    Rect rectSide2 = Rect.fromLTWH(0, 0, size.width, size.height);
    paintSide2.shader = gradientSide2.createShader(rectSide2);

    double radiusSide2 = 320.0;
    Path pathSide2 = Path();
    pathSide2
        .addOval(Rect.fromCircle(center: offsetSide, radius: radiusSide2 + 25));
    canvas.drawShadow(pathSide2, Colors.black54.withOpacity(.3), 8.0, true);
    canvas.drawCircle(offsetSide, radiusSide2, paintSide2);

    // Paint Side 1
    Paint paintSide1 = Paint();
    Gradient gradientSide1 = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFF06234),
        Color(0xFFFF65A5),
      ],
      stops: [.4, .8],
    );

    Rect rectSide1 = Rect.fromLTWH(0, 0, size.width, size.height);
    paintSide1.shader = gradientSide1.createShader(rectSide1);

    double radiusSide1 = 180.0;
    Path pathSide1 = Path();
    pathSide1
        .addOval(Rect.fromCircle(center: offsetSide, radius: radiusSide1 + 10));
    canvas.drawShadow(pathSide1, Colors.black54.withOpacity(.3), 8.0, true);
    canvas.drawCircle(offsetSide, radiusSide1, paintSide1);

    // Paint 2
    Paint paint2 = Paint();
    Gradient gradient2 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFF06234),
        Color(0xFFFF65A5),
      ],
      stops: [.0, .3],
    );

    Rect rect2 = Rect.fromLTWH(0, 0, size.width, size.height);
    paint2.shader = gradient2.createShader(rect2);
    double radius2 = 280.0;
    Path path = Path();

    path.addOval(Rect.fromCircle(center: offset, radius: radius2 + 10));
    canvas.drawShadow(path, Colors.black54.withOpacity(.4), 10.0, true);
    canvas.drawCircle(offset, radius2, paint2);

    // Paint 3
    Paint paint1 = Paint();
    Gradient gradient1 = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFFF8A64),
        Color(0xFFFF65A5),
      ],
      stops: [.2, .6],
    );

    Rect rect1 = Rect.fromLTWH(0, 0, size.width, size.height);
    paint1.shader = gradient1.createShader(rect1);
    double radius1 = 160.0;

    Path path1 = Path();
    path1.addOval(Rect.fromCircle(center: offset, radius: radius1 + 10));
    canvas.drawShadow(path1, Colors.black54.withOpacity(.2), 8.0, true);
    canvas.drawCircle(offset, radius1, paint1);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
