import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';
import 'package:kyros_app_mobile/services/database_service.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

class MessageChat extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String id;
  const MessageChat({Key? key, required this.imageUrl, required this.name, required this.id}) : super(key: key);

  @override
  _MessageChatState createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {

  var messages = [];
  final messageInputController = TextEditingController();

  displayMessage(Message msg) {
    String content = msg.content;
    print("Display message with content: $content");
  }

  displayMessages() {
    for (Message msg in messages) {
      displayMessage(msg);
    }
  }

  sendMessage() async {
    CollectionReference messages = FirebaseFirestore.instance.collection('chatrooms/${widget.id}/messages');
    if(messageInputController.text != ""){
      String message = messageInputController.text;
      var lastMessageTime = DateTime.now();

      DocumentSnapshot userInfo = await DatabaseService().getUserById(AuthService().getCurrentID());
      print(userInfo['username']);

      Map<String, dynamic> messageInfo = {
        'content': message,
        'sender': AuthService().getCurrentID(),
        'timestamp': lastMessageTime,
        'username': userInfo['username']
      };


      messages.add(messageInfo);

      messageInputController.text = '';

    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = FirebaseFirestore.instance.collection('chatrooms/${widget.id}/messages');
    print(messages);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleConstants.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
              AssetImage(widget.imageUrl),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
                children: [
                  Text(
                    widget.name,
                  ),
                ]
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFFE9E9E9),
      body: Column(
        children: [
          Expanded(child: Container(
            child: StreamBuilder(
              stream: messages.orderBy('timestamp', descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // print(snapshot);
                print(snapshot.data!.docs.length);
                return snapshot.hasData
                    ? ListView.builder(
                    padding: EdgeInsets.only(bottom: 70, top: 16),
                    itemCount: snapshot.data!.docs.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      print(snapshot.data!.docs[index]);
                      DocumentSnapshot msg = snapshot.data!.docs[index];
                      // DocumentSnapshot userInfo =  DatabaseService().getUserById(msg['sender']);
                      // return messageTile(msg['content'], msg['dateTime'], msg['sender']! == AuthService().getCurrentID(),);
                      return messageTile(msg['content'], msg['timestamp'], msg['sender']! == AuthService().getCurrentID(), msg['username']);
                    },)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),),
          Container(
            color: StyleConstants.black,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      primary: Color(0xFFF78154),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.ac_unit, // temp
                      color: Color(0xFF000000),
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  height: 30,
                  width: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      primary: Color(0xFF53A548),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Icon(
                      // Icons.ac_unit, // temp
                      Icons.send,
                      color: Color(0xFF000000),
                      size: 25,
                    ),
                    onPressed: () {
                      sendMessage();
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 30,
                    child: TextField(
                      controller: messageInputController,
                      autocorrect: true,
                      cursorColor: StyleConstants.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        labelText: "...",
                      ),

                      // onSubmitted: () async{
                      //   sendMessage();
                      // },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget messageTile(String content, Timestamp timestamp, bool bySelf, String name){
  DateTime date = DateTime.parse(timestamp.toDate().toString());
  return Column(
    children: [
      // if (newTimePeriod) Container(
      //   margin: EdgeInsets.only(top: 25),
      //   child: Text(dateTime.toString()),
      // ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 0, right: 15, ),
        child: Row(
          mainAxisAlignment: bySelf ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 15,
            ),
            // if (!bySelf) ...[
            //   if (lastOfCluster)
            //
            //   else
            //     SizedBox(width: 30),
            //   SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!bySelf) ...[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFFFFFFF),
                  ),
                  margin: EdgeInsets.only(top: 3),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    ],
  );
}

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {
        Key? key,
        required this.message,
        required this.newTimePeriod,
        required this.newCluster,
        required this.lastOfCluster,
      }
    ) : super(key: key);

  final Message message;
  final bool newTimePeriod;
  final bool newCluster;
  final bool lastOfCluster;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (newTimePeriod) Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(message.time.toString()),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: newCluster ? 10 : 0, right: 15, ),
          child: Row(
            mainAxisAlignment: message.bySelf ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!message.bySelf) ...[
                if (lastOfCluster)
                  CircleAvatar(
                    radius: 15,
                  )
                else
                  SizedBox(width: 30),
                SizedBox(width: 15),
              ]
              else
                Expanded(child: Container()),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (newCluster && !message.bySelf) ...[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        message.authorName,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFFFFFFF),
                    ),
                    margin: EdgeInsets.only(top: 3),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Text(
                      message.content,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              if (message.bySelf) ...[
                SizedBox(width: 15),
                if (lastOfCluster)
                  CircleAvatar(
                    radius: 15,
                  )
                else
                  SizedBox(width: 30),
              ]
              else
                Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
  }
}

class Message {
  final int authorID;
  final String authorName;
  final String content;
  final bool bySelf;

  DateTime? time;
  Message(this.authorID, this.authorName, this.content, {this.bySelf: false}) {
    time = DateTime.now();
  }
}