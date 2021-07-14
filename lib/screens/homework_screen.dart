import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/assignment_model.dart';
import 'assignment_screen.dart';

class HomeworkPage extends StatefulWidget {

  Assignment assignment;
  HomeworkPage({required this.assignment});

  _HomeworkPageState createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(height: 40),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentPage(assignment: widget.assignment)
                  )
                );
              },
              icon: Icon(CupertinoIcons.arrowtriangle_left_fill, color: Color(0xFFF78154),),
              label: Text('Back ', style: TextStyle(
                color: Color(0xFF152332),
              ))
            )
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            padding: const EdgeInsets.all(15),
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Color(0xFF152332)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.assignment.title, style: TextStyle (
                    fontSize: 25.0,
                    color: Color(0xFF152332)
                )
                ),
                Text('Due: ${widget.assignment.dueDate.month}/${widget.assignment.dueDate.day}/${widget.assignment.dueDate.year}'),
                Text('Description: ${widget.assignment.description}'),
                TextButton(
                  onPressed: () {},
                  child: Text('Upload File')
                ),
                Spacer(),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('  Save  ', style: TextStyle(
                          color: Colors.black,
                        )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD3D3D3)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black),
                            )
                          )
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('    Submit    ', style: TextStyle(
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
              ]
            ),
          ),
        ],
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
