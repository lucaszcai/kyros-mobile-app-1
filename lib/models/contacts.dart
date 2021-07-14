import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_model.dart';

class Contact_Box extends StatefulWidget {
  int index;

  Contact_Box({
    required this.index,

  });

  @override
  _ContactState createState() => _ContactState(index: index);
}

class _ContactState extends State<Contact_Box> {
  int index;

  _ContactState({
    required this.index,

  });
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      padding: EdgeInsets.only(
          top: 20
      ),

      child: Row(
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.only(
                left: 75
            ),

            child: FlatButton(
              onPressed: () {
                ;
              },
              child: Text(''),
              color: Colors.white,
              shape: CircleBorder(),


            ),

          ),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      width: 200,
                      margin: EdgeInsets.only(
                        left: 20,

                      ),
                      child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(contacts[index].name)
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(contacts[index].role)
                                ]

                            )
                          ]
                      ),


                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 340
                        ),


                        padding: EdgeInsets.only(
                            right: 50
                        ),

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(onPressed: () {
                                ;
                              },
                                child: Text(''),
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                              FlatButton(onPressed: () {
                                ;
                              },
                                child: Text(''),
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                            ]
                        )

                    ),
                  ]

              ),
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.green,
                      width: 3.0,
                    ),
                  )
              )

          ),


        ],

      ),
      color: Colors.grey[400],

    );
  }
}
