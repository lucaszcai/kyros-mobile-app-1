import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

class MessageChat extends StatefulWidget {
  final String imageUrl;
  const MessageChat({Key? key, required this.imageUrl}) : super(key: key);

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

  sendMessage(String content) {
    print("Message input submitted: $content");
    print("messages type: ${messages.runtimeType}");

    if (content == "") return;

    Message newMessage = Message(0, "name", content, bySelf: false);  // Message object is temp
    // Message newMessage = Message(1, "name", content, bySelf: true);  // Message object is temp

    messages.add(newMessage);

    setState(() {
      messageInputController.clear();
      displayMessage(newMessage);
    });

    return; // stub
  }

  @override
  Widget build(BuildContext context) {
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
                    "Chat Name",
                  ),
                ]
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFFE9E9E9),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                itemCount: messages.length,
                itemBuilder: (context, index) => () {
                  var newTP = index == 0
                      || messages[index].time
                          .difference(messages[index - 1].time)
                          .inSeconds > 30;
                  return MessageWidget(
                    message: () { print("index: $index"); return messages[index]; } (),
                    newTimePeriod: newTP,
                    newCluster: newTP
                      || messages[index].authorID != messages[index - 1].authorID
                    );
                 } ()
              ),
            ),
          ),
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
                      Icons.ac_unit, // temp
                      color: Color(0xFF000000),
                      size: 30,
                    ),
                    onPressed: () {},
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
                      onSubmitted: sendMessage,
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

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {
        Key? key,
        required this.message,
        required this.newTimePeriod,
        required this.newCluster
      }
    ) : super(key: key);

  final Message message;
  final bool newTimePeriod;
  final bool newCluster;

  @override
  Widget build(BuildContext context) {
    print(newCluster);
    return Column(
      children: [
        if (newTimePeriod) Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(message.time.toString()),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: newCluster ? 10 : 0, right: 15, ),
          child: Row(
            mainAxisAlignment: message.bySelf ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!message.bySelf) ...[
                if (newCluster)
                  CircleAvatar(
                    radius: 15,
                  )
                else
                  SizedBox(width: 30),
                SizedBox(width: 10),
              ]
              else
                Expanded(child: Container()),
              SizedBox(width: 10),
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
                SizedBox(width: 10),
                if (newCluster)
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