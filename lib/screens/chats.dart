import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyros_app_mobile/screens/ChatScreen.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';
import '../models/message.dart';
import 'message_chat.dart';

class chats extends StatelessWidget {
  const chats({Key? key}) : super(key: key);

  Widget chatRoomTile(BuildContext context, String imageUrl, String name, String lastMessage, bool unread, String chatId){
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
              return MessageChat(
                imageUrl: imageUrl, id: chatId, name: name,
              );
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
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                          AssetImage(imageUrl),
                        ),
                        unread
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
                          name,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            lastMessage,
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
                ClipRRect(
                  borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(20)),
                  child: IconSlideAction(
                    color: Colors.black54,
                    icon: Icons.star,
                  ),
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
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference chatrooms = FirebaseFirestore.instance.collection('chatrooms');

    return Container(
      height: 500.0,
      child: StreamBuilder(
          stream: chatrooms.where('members', arrayContains: AuthService().getCurrentID()).snapshots(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            return ListView(
              children: snapshot.data!.docs.map((chatroom){
                // print(chatroom.id);
                return chatRoomTile(context, "assets/Andrews.jpg", chatroom['name'], 'hello', false, chatroom.id);
              }).toList(),
            );
          }
      ),
    );

    // return Container(
    //   child: ListView.builder(
    //     itemCount: messages.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       final chat = messages[index];
    //       return Padding(
    //         padding: EdgeInsets.only(
    //           left: MediaQuery.of(context).size.width * 0.05,
    //           right: MediaQuery.of(context).size.width * 0.05,
    //           top: 5,
    //           bottom: 5,
    //         ),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(20),
    //           child: GestureDetector(
    //             onTap: () {
    //               Navigator.push(context, MaterialPageRoute(builder: (context) {
    //                 return MessageChat(
    //                   imageUrl: chat.sender.imageUrl,
    //                 );
    //               }));
    //             },
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 border: Border.all(color: Colors.grey),
    //                 borderRadius: BorderRadius.all(Radius.circular(20)),
    //               ),
    //               child: Slidable(
    //                 actionPane: SlidableScrollActionPane(),
    //                 actionExtentRatio: 1 / 8,
    //                 child: Padding(
    //                   padding: EdgeInsets.all(5),
    //                   child: Row(
    //                     children: [
    //                       Stack(
    //                         alignment: AlignmentDirectional.topEnd,
    //                         children: <Widget>[
    //                           CircleAvatar(
    //                             radius: 25,
    //                             backgroundImage:
    //                                 AssetImage(chat.sender.imageUrl),
    //                           ),
    //                           chat.unread
    //                               ? CircleAvatar(
    //                                   radius: 6,
    //                                   backgroundColor: Colors.red,
    //                                 )
    //                               : Text('')
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         width: 15,
    //                       ),
    //                       Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             chat.sender.name,
    //                             style: TextStyle(
    //                               color: Colors.black54,
    //                             ),
    //                           ),
    //                           Container(
    //                             width: MediaQuery.of(context).size.width * 0.60,
    //                             child: Text(
    //                               chat.text,
    //                               style: TextStyle(
    //                                 color: Colors.black45,
    //                               ),
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 secondaryActions: <Widget>[
    //                   ClipRRect(
    //                     borderRadius:
    //                         BorderRadius.horizontal(left: Radius.circular(20)),
    //                     child: IconSlideAction(
    //                       color: Colors.black54,
    //                       icon: Icons.star,
    //                     ),
    //                   ),
    //                   IconSlideAction(
    //                     color: Colors.red,
    //                     icon: Icons.delete,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
