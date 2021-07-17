import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/ChatScreen.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

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
      body: Center(child: chatScreen())
    );
  }
}
