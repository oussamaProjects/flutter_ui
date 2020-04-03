import 'package:flutter/material.dart';
import './../conversation.dart';
import './../message_provider.dart';

class ConversationList extends StatefulWidget {
  ConversationList({Key key}) : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  List<List<Conversation>> conversations = [
    MessageProvider.getConversations(),
    MessageProvider.getConversations(),
    MessageProvider.getConversations()
  ];
  Color _darkText = Color(0xFF111111);
  Color _ligthText = Color(0xFFa6a6a6);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 120.0,
      child: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: List.generate(
              conversations[position].length,
              (index) {
                if (index == 0)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _chatHead(context, "Today, 23"),
                      SizedBox(height: 8.0),
                      _chatElement(position, index)
                    ],
                  );
                return _chatElement(position, index);
              },
            ),
          );
        },
      ),
    );
  }

  Container _chatHead(BuildContext context, String day) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        day,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Card _chatElement(int position, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              child: CircleAvatar(
                backgroundImage: ExactAssetImage(
                  conversations[position][index].messages[0].sender.avatar,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  conversations[position][index].messages[0].sender.name,
                  style: TextStyle(
                    color:_darkText,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  conversations[position][index].messages[0].body,
                  style: TextStyle(
                    color: _ligthText,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            Transform.translate(
              key: Key('TTKEY'),
              offset: Offset(-16.0, -10.0),
              child: Text(
                conversations[position][index].messages[0].dateTime,
                style: TextStyle(
                  color: Color(0xFFf12280),
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
