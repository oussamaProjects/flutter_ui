import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/profiles/profile_4/provider.dart';
import 'package:flutter_ui/profiles/profile_4/user.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile4 extends StatefulWidget {
  Profile4({Key key}) : super(key: key);

  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile profile = ProfileProvider.getProfile();

  static Color _textColor = Color(0xFF4e4e4e);
  bool _visible = false;
  bool _visibleAfter = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _visible = true;
      });
    }).then((value) {
      setState(() {
        _visibleAfter = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/profiles/header_bg.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
          body: Align(
            alignment: Alignment.bottomCenter,
            child: _body(context),
          ),
        )
      ],
    );
  }

  _body(BuildContext context) {
    return Container(
      height: 350.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              _profileAvatar(context),
              Spacer(),
              _profileButtons(context),
            ],
          ),
          _profileTitle(context),
          _bodyText(context),
          _bottomBar(context),
        ],
      ),
    );
  }

  _profileAvatar(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 400),
      opacity: _visible ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.2),
                  ),
                ),
                Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.1),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        ExactAssetImage('assets/profiles/profile.jpg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _profileButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'ADD FRIEND',
              style: TextStyle(
                color: _textColor,
              ),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              side: BorderSide(color: _textColor),
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            width: 10.0,
          ),
          RaisedButton(
            child: Text(
              'FOLLOW',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            color: _textColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Column _profileTitle(BuildContext context) {
    return Column(
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
        Text(
          profile.user.address,
          style: TextStyle(
            color: _textColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Column _bodyText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
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

  _bottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _bottomBarCounter('Followers', profile.followers.toString()),
              _bottomBarCounter('Following', profile.following.toString()),
              _bottomBarCounter('Friends', profile.friends.toString()),
            ],
          ),
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

  TextStyle _bottomBarTitleStyle = TextStyle(color: Colors.grey.shade400);
  TextStyle _bottomBarCounterStyle =
      TextStyle(color: _textColor, fontSize: 22.0, fontWeight: FontWeight.bold);
}
