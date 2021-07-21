import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/message.dart';
import 'message_chat.dart';

class chats extends StatelessWidget {
  const chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          final chat = messages[index];
          return Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: 5,
              bottom: 5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MessageChat();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Slidable(
                    actionPane: SlidableScrollActionPane(),
                    actionExtentRatio: 1 / 8,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(chat.sender.imageUrl),
                              ),
                              chat.unread
                                  ? CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.red,
                                    )
                                  : Text('')
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.sender.name,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.60,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        color: Colors.black45,
                        icon: Icons.star,
                      ),
                      IconSlideAction(
                        color: Colors.red,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
