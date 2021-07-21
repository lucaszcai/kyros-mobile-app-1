import 'package:flutter/cupertino.dart';
import 'assignments_screen.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/assignment_model.dart';
import 'homework_screen.dart';
import 'package:kyros_app_mobile/models/assignment_comment_model.dart';
import 'dart:math' as math;

class AssignmentPage extends StatefulWidget {
  final Assignment assignment;

  AssignmentPage({required this.assignment});

  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  bool commentsVisibility = false;

  String updateCompletion(bool completed) {
    if (completed) return 'completed  ';
    return '';
  }

  Comment newComment = Comment('username', '', DateTime.now(), 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.00),
            child: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.arrowtriangle_left_fill,
                    color: Color(0xFFF78154),
                  ),
                  label: Text(' Back ',
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeworkPage(assignment: widget.assignment)),
                  );
                },
                child: Text('Submit Assignment',
                    style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF53A548)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black),
                    ))),
              )
            ])),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
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
                                  Text(
                                      '${widget.assignment.comments.length} comments',
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  Icon(CupertinoIcons.arrowtriangle_down_fill,
                                      size: 15.0, color: Color(0xFFF78154)),
                                ])),
                            SizedBox(width: 10),
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
                                              mainAxisAlignment: MainAxisAlignment.start,
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
                                                    padding: EdgeInsets.all(15.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                          maxLines: 5,
                                                          maxLength: 250,
                                                          onChanged: (input) {
                                                            setState(() {
                                                              newComment
                                                                      .description =
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
                                                                    fontSize: 15.0),
                                                              ),
                                                              Transform.rotate(
                                                                angle:
                                                                    math.pi / 4.0,
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      newComment
                                                                              .date =
                                                                          DateTime
                                                                              .now();
                                                                      widget
                                                                          .assignment
                                                                          .addComment(
                                                                              newComment);
                                                                    });
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
                                  Text(' add comment',
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
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.assignment.comments.length,
              itemBuilder: (BuildContext context, int index) {
                final Comment comment = widget.assignment.comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      // margin: EdgeInsets.fromLTRB(45, 0, 45, 15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFF5C6170))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(comment.name,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF152332))),
                                Spacer(),
                                Text(
                                    '${comment.date.month}/${comment.date.day}/${comment.date.year}',
                                    style: TextStyle(
                                        color: Color(0xFF152332),
                                        fontSize: 12.0))
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(comment.description),
                            SizedBox(height: 5),
                            Text('${comment.replies} replies',
                                style: TextStyle(
                                    fontSize: 12.0, color: Color(0xFF152332)))
                          ])),
                );
              },
            ))
      ]),
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
