import 'package:flutter/material.dart';

import '../chats.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //replace the body with the code for your page
      body: Center(child: chats()),
    );
  }
}
