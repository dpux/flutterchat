import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => {},
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 30.0),
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final Message message = messages[index];
              final bool isMe = message.sender.id == currentUser.id;
              return _buildMessage(message, isMe);
            },
          ),
        ),
      ),
    );
  }

  _buildMessage(Message message, bool isMe) {
//    final Widget x = doSth()
    return isMe
        ? Row(
            children: <Widget>[
//              _buildFavorite(isMe, message),
              _buildMessageContent(isMe, message),
            ],
          )
        : Row(
            children: <Widget>[
              _buildMessageContent(isMe, message),
              _buildFavorite(isMe, message)
            ],
          );
  }

  Widget _buildFavorite(bool isMe, Message message) {
    return IconButton(
      icon:
          message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
      iconSize: 30.0,
      onPressed: () {},
    );
  }

  Container _buildMessageContent(bool isMe, Message message) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0))
              : BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(message.text,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
