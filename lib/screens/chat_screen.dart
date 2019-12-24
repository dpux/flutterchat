import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  ChatScreen({Key key, this.user}) : super(key: key);
  final User user;



  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}