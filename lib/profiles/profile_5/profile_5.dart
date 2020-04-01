import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile_5/user.dart';
import 'package:flutter_ui/profiles/profile_5/provider.dart';

class Profile5 extends StatefulWidget {
  Profile5({Key key}) : super(key: key);

  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  @override
  Profile profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);
   
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        
      });
    }).then((value) {
      setState(() {
         
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: null),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            _profileAvatar(context),
            _profileTitle(context),
            _profileButtons(context),
            _tabBarContent(context),
          ],
        ),
      ),
    );
  }

  _tabBarContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1.0,
                  style: BorderStyle.solid),
              bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1.0,
                  style: BorderStyle.solid),
            ),
          ),
          width: 400,
          child: TabBar(
            labelColor: _textColor,
            indicatorColor: _textColor,
            indicatorWeight: 4,
            controller: _tabController,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 32.0),
            unselectedLabelColor: Colors.grey.shade400,
            tabs: [
              Tab(
                text: "Photos",
              ),
              Tab(
                text: "Videos",
              ),
              Tab(
                text: "Posts",
              ),
              Tab(
                text: "Friends",
              )
            ],
          ),
        ),
        Container(
          height: 250.0,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _photos(context),
              _videos(context),
              _posts(context),
              _friends(context),
            ],
          ),
        ),
      ],
    );
  }

  _friends(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 6,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: List.generate(25, (index) => _friendsAvatarBar('image')),
      ),
    );
  }

  _friendsAvatarBar(String image) {
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

  _profileAvatar(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 400),
      opacity: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.2),
                  ),
                ),
                Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.1),
                  ),
                ),
                Container(
                  height: 120.0,
                  width: 120.0,
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
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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

  _profileTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
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

  _posts(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
    );
  }
 
    
  _photos(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: EdgeInsets.all(8.0),
        children: List.generate(
          9,
          (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1.0,
                    blurRadius: 1.0),
                BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 2.0,
                    blurRadius: 1.0)
              ],
              image: DecorationImage(
                image: ExactAssetImage("assets/profiles/profile.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _videos(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: EdgeInsets.all(8.0),
        children: List.generate(
          9,
          (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1.0,
                    blurRadius: 1.0),
                BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 2.0,
                    blurRadius: 1.0)
              ],
              image: DecorationImage(
                image: ExactAssetImage("assets/profiles/profile.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
