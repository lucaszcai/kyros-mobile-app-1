import 'package:assignments_page/assignmentspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'assignmentmodel.dart';
import 'homeworkpage.dart';

class AssignmentPage extends StatefulWidget {

  final Assignment assignment;
  AssignmentPage({required this.assignment});

  _AssignmentPageState createState() => _AssignmentPageState();
}

// Random comment

class _AssignmentPageState extends State<AssignmentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(height: 40),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AssignmentsPage()
                          )
                        );
                      },
                      icon: Icon(CupertinoIcons.arrowtriangle_left_fill, color: Color(0xFFF78154),),
                      label: Text(' Back ', style: TextStyle(
                        color: Color(0xFF152332),
                        )
                      )
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeworkPage(assignment: widget.assignment)),
                        );
                      },
                      child: Text('  Submit Assignment  ', style: TextStyle(
                          color: Colors.black
                      )),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF53A548)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black),
                              )
                          )
                      ),
                    )
                  ]
              )
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0,
                      color: Color(0xFF152332)
                  )
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                  ]
                ),
                Text(
                  widget.assignment.title, style: TextStyle (
                        fontSize: 25.0,
                        color: Color(0xFF152332)
                    )
                ),
                SizedBox(height: 5),
                Text('Description: ${widget.assignment.description}'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text('  ${widget.assignment.comments.length} replies', style: TextStyle(
                            color: Colors.black,
                          )),
                          Icon(CupertinoIcons.arrowtriangle_down_fill,
                            size: 15.0,
                            color: Color(0xFFF78154)),
                        ]
                      )
                    ),
                    Text('Due: ${widget.assignment.dueDate.month}/${widget.assignment.dueDate.day}/${widget.assignment.dueDate.year}')
                  ]
                )
              ]
            )
          )
        ]
      ),
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
    );
  }
}
