import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile_1/user.dart';
import 'package:flutter_ui/profiles/profile_1/provider.dart';
 

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile1 extends StatefulWidget {
  Profile1({Key key}) : super(key: key);

  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Profile profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);

  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'SFUI'),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Image.asset(
            'assets/profiles/header_bg.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .45,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('PROFILE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.bars),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.cog),
                  onPressed: () {},
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                CustomPaint(
                  painter: ProfilePainter(),
                  child: Container(),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundImage:
                        ExactAssetImage("assets/profiles/profile.jpg"),
                    radius: 40,
                  ),
                  left: MediaQuery.of(context).size.height * .025,
                  top: MediaQuery.of(context).size.height * .22,
                ),
                _bodyText(context),
                _bottomBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned _bodyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .35,
      left: 24,
      right: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              profile.user.name,
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.w900,
                fontSize: 32,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.grey.shade400,
              ),
              Text(
                profile.user.address,
                style: TextStyle(
                  color: _textColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Text(
              'ABOUT ME',
              style: TextStyle(
                color: _textColor,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              profile.user.about,
              softWrap: true,
              style: TextStyle(
                  color: _textColor,
                  fontSize: 16,
                  height: 1.2,
                  letterSpacing: 1.1),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _bottomBarTitleStyle = TextStyle(
    color: Colors.grey.shade400,
  );
  TextStyle _bottomBarCounterStyle = TextStyle(
    color: _textColor,
    fontSize: 22.0,
  );

  Positioned _bottomBar(BuildContext context) {
    return Positioned(
      left: 24,
      right: 24,
      bottom: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _bottomBarCounter('Followers', profile.followers.toString()),
          _bottomBarCounter('Following', profile.following.toString()),
          _bottomBarCounter('Friends', profile.friends.toString()),
        ],
      ),
    );
  }

  Column _bottomBarCounter(String title, String subTitle) {
    return Column(
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: _bottomBarTitleStyle,
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          subTitle,
          style: _bottomBarCounterStyle,
        ),
      ],
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    path.lineTo(0, size.height * .32);
    path.lineTo(size.width, size.height * .4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
