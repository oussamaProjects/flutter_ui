import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Registration3 extends StatefulWidget {
  Registration3({Key key}) : super(key: key);

  @override
  _Registration3State createState() => _Registration3State();
}

class _Registration3State extends State<Registration3> {
  var _keyForm = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Color _buttonColor = Color(0xFFF9EA60);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(
        children: <Widget>[
          Container(color: Colors.blueGrey),
          CustomPaint(
            child: Container(),
            painter: Background1Painter(),
          ),
          Opacity(
            opacity: .4,
            child: CustomPaint(
              child: Container(),
              painter: Background2Painter(),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
              widthFactor: double.infinity,
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 24.0, right: 48.0),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login to start",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    labelText: "Your email",
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                    hintText: "email@address.com",
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabled: true,
                                    
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                TextFormField(
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white),
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                    hintText: "****************",
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                            suffixIcon: Icon(
                                      Icons.help_outline,
                                      color: Colors.white,
                                    ),
                                    isDense: true,
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: _buttonColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "GO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Forgot password",
                                style: TextStyle(
                                    color: _buttonColor, letterSpacing: 1.2),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                    color: _buttonColor, letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Background1Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 65);

    Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFF3181),
          Color(0xFFFA7537),
        ],
        stops: [
          .6,
          .9,
        ]);

    Path path = Path();
    Paint paint = Paint();

    paint.shader = gradient.createShader(rect);

    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width * .7, size.height * .64);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Background1Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Background1Painter oldDelegate) => false;
}

class Background2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 65);

    Gradient gradient = LinearGradient(colors: [
      Color(0xFFFF3181),
      Color(0xFFFA7537),
    ], stops: [
      .2,
      .8,
    ]);

    Path path = Path();
    Paint paint = Paint();

    paint.shader = gradient.createShader(rect);

    path.lineTo(0.0, size.height / 2 - 60.0);
    path.lineTo(size.width * .69, size.height * .635);
    path.lineTo(size.width, size.height / 2 - 60.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Background2Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Background2Painter oldDelegate) => false;
}
