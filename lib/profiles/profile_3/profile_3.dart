import 'dart:ui';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/profiles/profile_3/user.dart';
import 'package:flutter_ui/profiles/profile_3/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile3 extends StatefulWidget {
  Profile3({Key key}) : super(key: key);

  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  @override
  Profile profile = ProfileProvider.getProfile();
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

  static Color _textColor = Color(0xFF4e4e4e);

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/profiles/header_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
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
          body: Stack(
            children: <Widget>[
              Positioned(
                top: 50.0,
                left: 16.0,
                right: 16.0,
                bottom: 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: _visibleAfter ? 1 : 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 60.0, left: 16.0, right: 16.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(0, 0),
                        ),
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                          offset: Offset(0, 0),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: <Widget>[
                        _profileTitle(context),
                        _bottomBar(context),
                        _photosBar(context),
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
        _profileAvatar(context)
      ],
    );
  }

  Positioned _profileAvatar(BuildContext context) {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: _visible ? 1 : 0,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.2),
                  ),
                ),
                Container(
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.1),
                  ),
                ),
                Container(
                  height: 90,
                  width: 90,
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

  Column _profileTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            profile.user.name,
            style: TextStyle(
              color: _textColor,
              fontWeight: FontWeight.w900,
              fontSize: 22,
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
          padding: const EdgeInsets.only(bottom: 16.0),
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

  Column _bottomBar(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            child: Text(
              'FOLLOW',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            color: Colors.deepOrangeAccent,
            onPressed: () {},
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _bottomBarCounter('Followers', profile.followers.toString()),
            _bottomBarCounter('Following', profile.following.toString()),
            _bottomBarCounter('Friends', profile.friends.toString()),
          ],
        ),
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
          height: 64,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(25, (index) => _friendsAvatarBar('image')),
          ),
        ),
      ],
    );
  }

  Container _friendsAvatarBar(String image) {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black87, blurRadius: 2.0, spreadRadius: 0.0)
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
          image: ExactAssetImage('assets/profiles/profile.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Column _photosBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'PHOTOS(25)',
            style: TextStyle(
              color: _textColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          height: 114.0,
          width: MediaQuery.of(context).size.width,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(25, (index) => _photo(context))),
        ),
      ],
    );
  }

  Container _photo(BuildContext context) {
    return Container(
      height: 110.0,
      width: 110.0,
      margin: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 16.0),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 1.0)],
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage('assets/profiles/header_bg.jpg'),
        ),
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
