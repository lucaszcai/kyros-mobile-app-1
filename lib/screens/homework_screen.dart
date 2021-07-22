import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/assignment_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeworkPage extends StatefulWidget {

  Assignment assignment;
  HomeworkPage({required this.assignment});

  _HomeworkPageState createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {

  File? _pickedImage;

  Future<File> pickImage(ImageSource source) async {
    PickedFile? picked = await ImagePicker().getImage(source: source);
    if (picked != null) {
      return File(picked.path);
    } else {
      return File('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE9E9E9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(30, 10, 0, 10),
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
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
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white,
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
                    SizedBox(height: 5),
                    Text('Due: ${widget.assignment.dueDate.month}/${widget.assignment.dueDate.day}/${widget.assignment.dueDate.year}'),
                    SizedBox(height: 5),
                    Text('Description: ${widget.assignment.description}'),
                    TextButton(
                        onPressed: () async {
                          ImageSource returnedSource = await showDialog(
                              context: context,
                              builder: (BuildContext context) => new AlertDialog(
                                  content: Container(
                                    width: 300,
                                    height: 125,
                                    child: Column(
                                        children: [
                                          TextButton.icon(
                                              onPressed: () => Navigator.pop(context, ImageSource.camera),
                                              icon: Icon(CupertinoIcons.camera_fill, color: Color(0xFF152332),),
                                              label: Text('Take Photo')
                                          ),
                                          TextButton.icon(
                                              onPressed: () => Navigator.pop(context, ImageSource.gallery),
                                              icon: Icon(CupertinoIcons.photo_fill_on_rectangle_fill, color: Color(0xFF152332)),
                                              label: Text('Choose From Gallery')
                                          )
                                        ]
                                    ),
                                  )
                              )
                          );

                          File returnedImage = await pickImage(returnedSource);
                          setState(() {
                            _pickedImage = returnedImage;
                          });

                        },
                        child: Text('Upload Image')
                    ),
                    Center(
                        child: Container(
                            child: _pickedImage != null ? Image.file(_pickedImage!) : Text('No image uploaded')
                        )
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
      )
      // bottomNavigationBar: BottomAppBar(
      //   color: Color(0xFF152332),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: IconButton(
      //           icon: Icon(Icons.add_circle),
      //           color: Colors.white,
      //           onPressed: () {},
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: IconButton(
      //           icon: Icon(Icons.add_circle),
      //           color: Colors.white,
      //           onPressed: () {},
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: IconButton(
      //           icon: Icon(Icons.add_circle),
      //           color: Colors.white,
      //           onPressed: () {},
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: IconButton(
      //           icon: Icon(Icons.add_circle),
      //           color: Colors.white,
      //           onPressed: () {},
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

}
