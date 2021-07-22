import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';
import 'package:kyros_app_mobile/widgets/search_bar_widget.dart';

import 'chats.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: StyleConstants.grey,
        appBar: AppBar(
          backgroundColor: StyleConstants.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchBar(),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: GestureDetector(
                  onTap: () {
                    print('pressed');
                  },
                  child: Icon(
                    Icons.add,
                    color: StyleConstants.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: new DefaultTabController(
          length: 2,
          child: new Scaffold(
            appBar: new PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: new Container(
                color: StyleConstants.black,
                child: new SafeArea(
                    child: new TabBar(
                        tabs: [
                          new Container(
                            child: new Tab(text: 'Direct Messages'),
                          ),
                          new Container(
                            child: new Tab(text: 'Group Messages'),
                          ),
                        ],
                      ),
                  ),
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: chats(),
                      ),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: chats(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
