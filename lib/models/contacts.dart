import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_model.dart';

class Contact_Box extends StatefulWidget {
  Contact index;

  Contact_Box({
    required this.index,

  });

  @override
  _ContactState createState() => _ContactState(index: index);
}

class _ContactState extends State<Contact_Box> {
  Contact index;

  _ContactState({
    required this.index,


  });
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      padding: EdgeInsets.only(
          top: 20,
          bottom: 0,
          left: 0,
          right: 0
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.only(
                left: 75,
                right: 0,
                bottom: 0,
                top: 0
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
            alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                right:50,
                left: 30
              ),



              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(

                      height: 60,

                      child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(index.name)
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(index.role)
                                ]

                            )
                          ]
                      ),


                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(
                          left: 125

                        ),

                        child: Row(
                            children: [
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



    );
  }
}
