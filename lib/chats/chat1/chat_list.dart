import 'package:flutter/material.dart';
import 'package:flutter_ui/chats/conversation.dart';
import 'package:flutter_ui/chats/message_provider.dart';
import 'package:flutter_ui/chats/tabs/inbox.dart';

import 'package:google_fonts/google_fonts.dart';

class ChatList extends StatefulWidget {
  ChatList({Key key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList>
    with SingleTickerProviderStateMixin {
  List<Conversation> converations = MessageProvider.getConversations();
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          Container(
            color: Colors.grey.shade100,
          ),
          CustomPaint(
            painter: ChatBackground(),
            child: Container(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("MESSAGE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              centerTitle: true,
              leading: Icon(Icons.chevron_left),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Color(0xFFf76aa4),
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(),
                    tabs: [
                      Tab(
                        text: "Inbox",
                      ),
                      Tab(
                        text: "Groups",
                      ),
                      Tab(
                        text: "Online(25)",
                      ),
                      Tab(
                        text: "History",
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 26.0),
                  height: MediaQuery.of(context).size.height - 120.0,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ConversationList(),
                      ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('tedt');
                        },
                      ),
                      Container(child: Text('ghgh')),
                      Container(child: Text('ghgh')),
                    ],
                  ),
                ),
              ],
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   items: <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(icon: Icon(Icons.chevron_left)),
            //     BottomNavigationBarItem(icon: Icon(Icons.chevron_left)),
            //     BottomNavigationBarItem(icon: Icon(Icons.chevron_left)),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

class ChatBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 65);

    Gradient gradient = LinearGradient(colors: [
      Color(0xFFef1385),
      Color(0xFFf12280),
      Color(0xFFf63d76),
      Color(0xFFf84f70),
    ], stops: [
      .2,
      .4,
      .6,
      .8,
    ]);

    Paint paint = Paint()..shader = gradient.createShader(rect);
    Path path = Path();

    paint.style = PaintingStyle.fill;

    path.lineTo(0, 0);
    path.lineTo(0, size.height * .3);
    // path.lineTo(size.width * .3, size.height * .5);
    path.quadraticBezierTo(
        size.width * .5, size.height * .8, size.width, size.height * .3);
    // path.lineTo(size.width * .5, size.height * .5);
    // path.lineTo(size.width * .555, size.height * .6);
    // path.lineTo(size.width, size.height * .3);
    path.lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
