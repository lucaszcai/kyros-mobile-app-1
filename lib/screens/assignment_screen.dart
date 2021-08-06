import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/assignment_model.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';
import 'package:kyros_app_mobile/services/database_service.dart';

import 'dart:math' as math;



class AssignmentPage extends StatefulWidget {
  final Assignment assignment;

  // AssignmentPage({required this.assignment});

  final String assignmentId;

  const AssignmentPage(
      {Key? key, required this.assignmentId, required this.assignment})
      : super(key: key);

  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  bool commentsVisibility = false;

  String updateCompletion(bool completed) {
    if (completed) return 'completed  ';
    return '';
  }

  String updateSubmit(bool completed) {
    if (completed) {
      return 'Submit Again';
    }
    return 'Submit Assignment';
  }


  String newComment = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference comments = FirebaseFirestore.instance
        .collection('assignments/${widget.assignmentId}/comments');

    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    // DocumentSnapshot documentSnapshot = await users.doc('IGd3ogByriNqy9uEkVgADTbXZNK2').get();
    // print(users.doc('IGd3ogByriNqy9uEkVgADTbXZNK2').get(['username']));

    return Scaffold(
        body: Container(
          color: Color(0xFFE9E9E9),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.arrowtriangle_left_fill,
                        color: Color(0xFFF78154),
                      ),
                      label: Text('Back ',
                          style: TextStyle(
                            color: Color(0xFF152332),
                          ))),
                  Spacer(),
                  Text(
                    updateCompletion(widget.assignment.completed),
                    style: TextStyle(
                      color: Color(0xFFF78154),
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               HomeworkPage(assignment: widget.assignment)),
                  //     ).then((value) {
                  //       setState(() {
                  //         // refresh state of assignment screen
                  //       });
                  //     });
                  //   },
                  //   child: Text(updateSubmit(widget.assignment.completed),
                  //       style: TextStyle(color: Colors.black)),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStateProperty.all<Color>(Color(0xFF53A548)),
                  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(18.0),
                  //         side: BorderSide(color: Colors.black),
                  //       ))),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Color(0xFF152332))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Spacer(),
                        ]),
                        Text(widget.assignment.title,
                            style: TextStyle(
                                fontSize: 25.0, color: Color(0xFF152332))),
                        SizedBox(height: 5),
                        Text('Description: ${widget.assignment.description}'),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(50, 30),
                                        alignment: Alignment.centerLeft),
                                    onPressed: () {
                                      setState(() {
                                        if (commentsVisibility) {
                                          commentsVisibility = false;
                                        } else {
                                          commentsVisibility = true;
                                        }
                                      });
                                    },
                                    child: Row(children: [
                                      // Text(
                                      //     '${widget.assignment.comments.length} replies',
                                      //     style: TextStyle(
                                      //       color: Colors.black,
                                      //     ),
                                      // ),
                                      Icon(CupertinoIcons.arrowtriangle_down_fill,
                                          size: 15.0, color: Color(0xFFF78154)),
                                    ])),
                                SizedBox(width: 5),
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                        new AlertDialog(
                                          backgroundColor: Color(0xFF393C46),
                                          content: Container(
                                            height: 250,
                                            width: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    // IconButton(
                                                    //   onPressed: () {
                                                    //     Navigator.of(context).pop();
                                                    //   },
                                                    //   icon: Icon(
                                                    //       CupertinoIcons.xmark_circle,
                                                    //       color: Colors.white),
                                                    // ),
                                                    Expanded(
                                                      child: Container(
                                                        //height: 230,
                                                        // width: 100,
                                                        padding:
                                                        EdgeInsets.all(15.0),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          children: [
                                                            TextField(
                                                              keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                              maxLines: 5,
                                                              maxLength: 250,
                                                              onChanged: (input) {
                                                                setState(() {
                                                                  newComment =
                                                                      input;
                                                                });
                                                              },
                                                              decoration:
                                                              new InputDecoration(
                                                                hintText:
                                                                'Add a comment...',
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '250 character limit',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        15.0),
                                                                  ),
                                                                  Transform.rotate(
                                                                    angle: math.pi /
                                                                        4.0,
                                                                    child:
                                                                    IconButton(
                                                                      onPressed:
                                                                          ()  async {
                                                                        DocumentSnapshot userInfo = await DatabaseService().getUserById(AuthService().getCurrentID());
                                                                        print(userInfo['username']);
                                                                        comments.add(
                                                                            {
                                                                              'user': userInfo['username'],
                                                                              'content': newComment
                                                                            });
                                                                        // setState(
                                                                        //     () {
                                                                        //   // widget.assignment.addComment(new Comment(
                                                                        //   //     'username',
                                                                        //   //     newComment,
                                                                        //   //     DateTime
                                                                        //   //         .now(),
                                                                        //   //     0));
                                                                        // });
                                                                        Navigator.of(
                                                                            context)
                                                                            .pop();
                                                                      },
                                                                      icon: Icon(
                                                                        CupertinoIcons
                                                                            .paperplane_fill,
                                                                        color: Color(
                                                                            0xFFF78154),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(children: [
                                      Icon(CupertinoIcons.plus_circle,
                                          color: Colors.black),
                                      Text(' reply',
                                          style: TextStyle(color: Colors.black)),
                                    ]))
                              ]),
                              Text(
                                  'Due: ${widget.assignment.dueDate.month}/${widget.assignment.dueDate.day}/${widget.assignment.dueDate.year}')
                            ])
                      ])),
            ),
            Visibility(
              visible: commentsVisibility,
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: StreamBuilder(
                    stream: comments.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                      return snapshot.hasData ?
                      ListView(
                        children: snapshot.data!.docs.map((comment){
                          return ListTile(title: Text(comment['user']), subtitle: Text(comment['content']),);
                        }).toList(),
                      ): Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),

          ]),
        )
      /*
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF152332),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
       */
    );
  }
}
