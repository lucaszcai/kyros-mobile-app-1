import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

import 'chats.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({Key? key}) : super(key: key);

  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
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
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(top: 8, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search',
                  ),
                ),
              ),
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
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black12),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          'Direct Message',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black54,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          'Group Message',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: chats(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
