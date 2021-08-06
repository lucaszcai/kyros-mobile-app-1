import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';
import 'package:kyros_app_mobile/widgets/search_bar_widget.dart';

import 'chats.dart';
import 'login_screen.dart';

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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            AuthService().signOut().then((s) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
            });
          },
        ),
        backgroundColor: StyleConstants.grey,
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                color: StyleConstants.black,
                child: SafeArea(
                  child: Container(
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.orange,
                      tabs: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Tab(
                            text: 'Direct Message',
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Tab(
                            text: 'Group Messages',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SearchBar(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Icon(
                            Icons.add,
                            color: StyleConstants.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: chats(),
                            ),
                          ),
                        ],
                      ),
                      Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
