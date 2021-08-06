import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/assignment_model.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';
import 'assignment_screen.dart';

class AssignmentsScreen extends StatefulWidget {
  _AssignmentsScreenState createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  //
  // List<Assignment> searched = assignments;
  // String searchInput = '';
  //
  // void search() {
  //   setState(() {
  //     if (searchInput == '') {
  //       searched = assignments;
  //     } else {
  //       searched = [];
  //       for (Assignment assignment in assignments) {
  //         if (assignment.title.length >= searchInput.length) {
  //           if (assignment.title.toLowerCase().contains(searchInput.toLowerCase())) {
  //             searched.add(assignment);
  //           }
  //         }
  //       }
  //     }
  //   });
  // }

  String updateCompletion(bool completed) {
    if (completed) return 'completed';
    return '';
  }

  Widget assignmentWidget(Assignment assignment, String assignmentId) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Color(0xFF5C6170))),
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AssignmentPage(
                      assignment: assignment,
                      assignmentId: assignmentId,
                    )));
          },
          child: Container(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Row(children: [
                  Container(
                      width: 215,
                      child: Text(assignment.title,
                          style: TextStyle(
                              fontSize: 23.0, color: Color(0xFF152332)))),
                  // Text(updateCompletion(assignment.completed), style: TextStyle(
                  //   color: Color(0xFFF78154),
                  //   fontSize: 14.0,
                  //   fontStyle: FontStyle.italic,
                  // ),),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  // Text(
                  //     "${assignment.comments.length} comments",
                  //     style: TextStyle (
                  //         color: Color(0xFF152332)
                  //     )),
                  Spacer(),
                  Text(
                      'Due: ${assignment.dueDate.month}/${assignment.dueDate.day}/${assignment.dueDate.year}',
                      style: TextStyle(
                        color: Color(0xFF152332),
                      ))
                ])
              ]))),
    );
  }


  @override
  Widget build(BuildContext context) {
    CollectionReference assignments = FirebaseFirestore.instance.collection('assignments');


    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleConstants.black,
        title: Container(
            height: 40,
            // width: 300,
            alignment: Alignment.center,
            child: TextField(
              onChanged: (input) {
                // searchInput = input;
                // search();
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(60.0),
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize:16),
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.white
              ),
            ),
          ),
        ),
      body: Column (
        children: <Widget> [

          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xFFE9E9E9)
              ),
              child: StreamBuilder(
                  stream: assignments
                      .where('completed', isEqualTo: false)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((assignment) {
                        // Assignment assignment = Assignment.fromDocument(doc);
                        // var date = DateTime.parse(assignment['dueDate'].toDate().toString());
                        // print(assignment['dueDate']);
                        // return Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       border: Border.all(
                        //           color: Color(0xFF5C6170)
                        //       )
                        //   ),
                        //   child: TextButton(
                        //       onPressed: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (context) => AssignmentPage(assignmentId: assignment.id,))
                        //         ).then((value) {
                        //           setState(() {
                        //             // refresh state of assignment screen
                        //           });
                        //         });
                        //       },
                        //       child: Container(
                        //           padding: EdgeInsets.all(15),
                        //           child: Column(
                        //               children: [
                        //                 Row(
                        //                     children: [
                        //                       Container(
                        //                           width: 215,
                        //                           child: Text(
                        //                               assignment['title'],
                        //                               style: TextStyle (
                        //                                   fontSize: 23.0,
                        //                                   color: Color(0xFF152332)
                        //                               )
                        //                           )
                        //                       ),
                        //                       // Text(updateCompletion(assignment.completed), style: TextStyle(
                        //                       //   color: Color(0xFFF78154),
                        //                       //   fontSize: 14.0,
                        //                       //   fontStyle: FontStyle.italic,
                        //                       // ),),
                        //                     ]
                        //                 ),
                        //                 SizedBox(height: 15),
                        //                 Row(
                        //                     children: [
                        //                       // Text(
                        //                       //     "${assignment.comments.length} comments",
                        //                       //     style: TextStyle (
                        //                       //         color: Color(0xFF152332)
                        //                       //     )),
                        //                       Spacer(),
                        //                       Text(
                        //                           'Due: ${date.month}/${date.day}/${date.year}',
                        //                           style: TextStyle (
                        //                             color: Color(0xFF152332),
                        //                           )
                        //                       )
                        //                     ]
                        //                 )
                        //               ]
                        //           )
                        //       )
                        //   ),
                        // );

                        return assignmentWidget(
                            Assignment.fromDocument(assignment), assignment.id);
                      }).toList(),
                    );
                  }),
            ),
          ),
        ],
      ),
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