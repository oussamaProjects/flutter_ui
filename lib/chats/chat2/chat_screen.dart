import 'package:flutter/material.dart';
import 'package:flutter_ui/chats/conversation.dart';
import 'package:flutter_ui/chats/message.dart';
import 'package:flutter_ui/chats/message_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;
  final String name;
  ChatScreen(this.conversation, this.name);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  final LinearGradient _gradient = LinearGradient(colors: [
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

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(gradient: _gradient),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text("Elise Remmi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  centerTitle: true,
                  leading: Icon(Icons.chevron_left),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.settings),
                    )
                  ],
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                body: Column(
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                        itemCount: widget.conversation.messages.length,
                        itemBuilder: (BuildContext context, int position) {
                          if (widget.conversation.messages[position].sender
                                  .name ==
                              widget.name) {
                            return _rightMessage(
                                widget.conversation.messages[position]);
                          }
                          return _leftMessage(
                              widget.conversation.messages[position]);
                        },
                      ),
                    ),
                    _sendMessageForm(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(10.0, 30.0),
                child: Text(
                  message.dateTime,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    message.receiver.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    message.receiver.phone,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                margin: EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(message.receiver.avatar),
                  ),
                  shape: BoxShape.circle,
                ),
                height: 75,
                width: 75,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Text(
              message.body,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _leftMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                margin: EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(message.receiver.avatar),
                  ),
                  shape: BoxShape.circle,
                ),
                height: 75,
                width: 75,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.receiver.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    message.receiver.phone,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(-10.0, 30.0),
                child: Text(
                  message.dateTime,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Text(
              message.body,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  _sendMessageForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
      child: Form(
        key: _key,
        child: Stack(
          children: <Widget>[
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Write messsage',
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Transform.translate(
                  offset: Offset(-6.0, 6.0),
                  child: Container(
                    height: 40.0,
                    width: 44.0,
                    decoration: BoxDecoration(
                        gradient: _gradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        )),
                    child: Icon(
                      FontAwesomeIcons.paperPlane,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
