import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/contact_model.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

import 'contact_screen.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String searchInput = '';
  List display_contacts = AllKyrosUsers;
  bool showDescription = false;
  int selectedContact = 0;
  bool mutualContact = true;
  String sameContact = '';
  bool save = false;
  List unsaved_contacts = [];
  List deleted_contacts = [];

  void search() {
    setState(() {
      if (searchInput == '') {
        display_contacts = AllKyrosUsers;
      } else {
        display_contacts = [];
        for (Contact contact in AllKyrosUsers) {
          if (contact.name.length >= searchInput.length) {
            if (contact.name
                .toLowerCase()
                .contains(searchInput.toLowerCase())) {
              display_contacts.add(contact);
            }
          }
        }
      }
    });
  }

  void viewDescription(int index) {
    if (showDescription == true) {
      setState(() {
        showDescription = false;
      });
    } else {
      setState(() {
        showDescription = true;
        selectedContact = index;
      });
    }
  }

  bool checkMutualContact(String index) {
    for (Contact contact in current_user_contacts) {
      if (index.contains(contact.name)) {
        sameContact = contact.name;
      } else {
        ;
      }
    }
    if (sameContact.contains(index)) {
      return true;
    } else {
      return false;
    }
  }

  void add_contact(int index) {
    if (current_user_contacts.contains(display_contacts[index])) {
      setState(() {
        deleted_contacts.add(display_contacts[index]);
        current_user_contacts.remove(display_contacts[index]);
        save = true;
        checkMutualContact(display_contacts[index].name);
      });
    } else {
      setState(() {
        unsaved_contacts.add(display_contacts[index]);
        current_user_contacts.add(display_contacts[index]);
        save = true;
      });
    }
  }

  void clear_new_contacts() {
    for (Contact contact in unsaved_contacts) {
      if (current_user_contacts.contains(contact)) {
        setState(() {
          current_user_contacts.remove(contact);
          unsaved_contacts.remove(contact);
        });
      }
    }
  }

  void clear_old_contacts() {
    for (Contact contact in deleted_contacts) {
      setState(() {
        current_user_contacts.add(contact);
        deleted_contacts.remove(contact);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Query currentUser = users.where('id', isEqualTo: AuthService().getCurrentID());


    List<String> contacts = [];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: StyleConstants.black,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 40,
              width: 230,
              alignment: Alignment.center,
              child: TextField(
                onChanged: (input) {
                  searchInput = input;
                  search();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(60.0),
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Colors.white),
              ),
            ),
            FlatButton(
              onPressed: () {

              },
              child: Icon(Icons.add, color: Colors.grey),
              color: Colors.white,
              shape: CircleBorder(),
            )
          ])),
      body: Center(
          child: Column(children: [
        // Expanded(
        //   child: ListView.builder(
        //       itemCount: display_contacts.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         final contact = display_contacts[index];
        //         return Column(
        //           children: [
        //             Container(
        //               height: 60,
        //               padding:
        //               EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Container(
        //                     height: 60,
        //                     child: FlatButton(
        //                       onPressed: () {
        //                         viewDescription(index);
        //                       },
        //                       child: CircleAvatar(
        //                         radius: 30,
        //                         backgroundImage: AssetImage(contact.Image_URL),
        //                       ),
        //                       color: Colors.white,
        //                       shape: CircleBorder(),
        //                     ),
        //                   ),
        //                   Container(
        //                     alignment: Alignment.centerRight,
        //                     // padding: EdgeInsets.only(right: 50, left: 30),
        //                     child: Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Container(
        //                             height: 60,
        //                             child: Column(children: [
        //                               Row(
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.start,
        //                                   children: [Text(contact.name)]),
        //                               Row(
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.start,
        //                                   children: [Text(contact.role)])
        //                             ]),
        //                           ),
        //                           Container(
        //                               alignment: Alignment.centerRight,
        //                               padding: EdgeInsets.only(left: 125),
        //                               child: Row(children: [
        //                                 FlatButton(
        //                                   onPressed: () {
        //                                     add_contact(index);
        //                                   },
        //                                   child: _buildIcon(contact),
        //                                   color: Colors.white,
        //                                   shape: CircleBorder(),
        //                                 ),
        //                               ])),
        //                         ]),
        //                     // decoration: BoxDecoration(
        //                     //     border: Border(
        //                     //   bottom: BorderSide(
        //                     //     color: Colors.green,
        //                     //     width: 3.0,
        //                     //   ),
        //                     // ))
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 15.0),
        //               child: Divider(color: StyleConstants.green, thickness: 3.0,),
        //             ),
        //           ],
        //         );
        //       }),
        // ),
        Expanded(
          child: StreamBuilder(
              stream: users.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return ListView(
                  children: snapshot.data!.docs.map((user) {
                    // print(chatroom['members']);
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          padding: EdgeInsets.only(
                              top: 20, bottom: 0, left: 0, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/Andrews.jpg'),
                                  ),
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                // padding: EdgeInsets.only(right: 50, left: 30),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 60,
                                        child: Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(user['username'])
                                              ]),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [Text('manager')])
                                        ]),
                                      ),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(left: 125),
                                          child: Row(children: [
                                            FlatButton(
                                              onPressed: () {
                                                if(user['contacts'].contains(AuthService().getCurrentID())){
                                                  List contactList = user['contacts'];
                                                  contactList.remove(AuthService().getCurrentID());
                                                  users.doc(user.id).set({'contacts': contactList, 'username': user['username'], 'email': user['email']});
                                                }
                                                else{
                                                  List contactList = user['contacts'];
                                                  contactList.add(AuthService().getCurrentID());
                                                  users.doc(user.id).set({'contacts': contactList, 'username': user['username'], 'email': user['email']});


                                                  // List myContactList = user['contacts'];
                                                  // contactList.add(AuthService().getCurrentID());
                                                  // users.doc(AuthService().getCurrentID());
                                                }
                                                // user['contacts'].contains("");
                                                // add_contact(index);
                                              },
                                              child: _buildIcon(user['contacts'].contains(AuthService().getCurrentID())),
                                              // child: Icon(Icons.add),
                                              shape: CircleBorder(),
                                            ),
                                          ])),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Divider(
                            color: StyleConstants.green,
                            thickness: 3.0,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }),
        )


      ])),
      backgroundColor: Colors.grey[400],
    );
  }

Widget _buildIcon(bool added) {


  if (added == true) {
    return Icon(Icons.remove);
  } else {
    return Icon(Icons.add);
  }
}
}
