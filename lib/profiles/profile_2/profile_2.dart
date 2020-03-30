import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile_2/user.dart';
import 'provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile2 extends StatefulWidget {
  Profile2({Key key}) : super(key: key);

  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  final ScrollController scrollController = ScrollController();

  Profile profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);
  static Color _textColorLight = Color(0XFFFFFFFF);

  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'SFUI'),
      child:
          Stack(alignment: AlignmentDirectional.topCenter, children: <Widget>[
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
            title: Text(
              'PROFILE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
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
              _profileAvatar(context),
              _profileTitle(context),
              Positioned(
                top: MediaQuery.of(context).size.height * .35,
                left: 24,
                right: 24,
                bottom: 0,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _bottomBar(context),
                        _bodyText(context),
                        _friendsBar(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Positioned _profileAvatar(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.3)),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.2)),
              ),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/profiles/profile.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _profileTitle(BuildContext context) {
    return Positioned(
      top: 120,
      left: 24,
      right: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              profile.user.name,
              style: TextStyle(
                color: _textColorLight,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
          ),
          Text(
            profile.user.address,
            style: TextStyle(
              color: _textColorLight,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Column _bodyText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Divider(
          height: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Text(
            'ABOUT ME',
            style: TextStyle(
              color: _textColor,
            ),
          ),
        ),
        Container(
          child: Text(
            profile.user.about,
            softWrap: true,
            style: TextStyle(
              color: _textColor,
              fontSize: 16,
              height: 1.2,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ],
    );
  }

  Row _bottomBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _bottomBarCounter('Followers', profile.followers.toString()),
        _bottomBarCounter('Following', profile.following.toString()),
        _bottomBarCounter('Friends', profile.friends.toString()),
      ],
    );
  }

  Column _friendsBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'FRIENDS',
            style: TextStyle(
              color: _textColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(25, (index) => _friendsAvatarBar('image')),
          ),
        ),
      ],
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

  TextStyle _bottomBarTitleStyle = TextStyle(
    color: Colors.grey.shade400,
  );
  TextStyle _bottomBarCounterStyle = TextStyle(
    color: _textColor,
    fontSize: 22.0,
  );
}

_friendsAvatarBar(String image) {
  return Container(
    height: 60,
    width: 60,
    margin: EdgeInsets.only(right: 8.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: ExactAssetImage(
          'assets/profiles/profile.jpg',
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 

    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    path.lineTo(0, size.height * .37);
    path.lineTo(size.width, size.height * .37);
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
