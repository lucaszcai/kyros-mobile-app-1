import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/contact_model.dart';
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
                ;
              },
              child: Icon(Icons.add, color: Colors.grey),
              color: Colors.white,
              shape: CircleBorder(),
            )
          ])),
      body: Center(
          child: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: display_contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = display_contacts[index];
                return Column(
                  children: [
                    Container(
                      height: 60,
                      padding:
                      EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            child: FlatButton(
                              onPressed: () {
                                viewDescription(index);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(contact.Image_URL),
                              ),
                              color: Colors.white,
                              shape: CircleBorder(),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            // padding: EdgeInsets.only(right: 50, left: 30),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    child: Column(children: [
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [Text(contact.name)]),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [Text(contact.role)])
                                    ]),
                                  ),
                                  Container(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.only(left: 125),
                                      child: Row(children: [
                                        FlatButton(
                                          onPressed: () {
                                            add_contact(index);
                                          },
                                          child: _buildIcon(contact),
                                          color: Colors.white,
                                          shape: CircleBorder(),
                                        ),
                                      ])),
                                ]),
                            // decoration: BoxDecoration(
                            //     border: Border(
                            //   bottom: BorderSide(
                            //     color: Colors.green,
                            //     width: 3.0,
                            //   ),
                            // ))
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(color: StyleConstants.green, thickness: 3.0,),
                    ),
                  ],
                );
              }),
        ),
        Visibility(
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            visible: showDescription,
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.red,
                    ),
                    color: Colors.black12),
                child: Center(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            onPressed: () {
                              ;
                            },
                            child: Icon(Icons.add_comment_rounded),
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 15, right: 10),
                              child: FlatButton(
                                onPressed: () {
                                  ;
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      display_contacts[selectedContact]
                                          .Image_URL),
                                ),
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                            ),
                            Text(display_contacts[selectedContact].name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ))
                          ],
                        ))
                      ],
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 25, bottom: 5),
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 30,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                            (display_contacts[selectedContact].description)))
                  ],
                )))),
        Visibility(
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            visible: save,
            child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: FlatButton(
                          onPressed: () {
                            clear_new_contacts();
                            clear_old_contacts();
                            Navigator.pop(context);
                          },
                          child: Text("Clear",
                              style: TextStyle(color: Colors.red))),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Save",
                              style: TextStyle(color: Colors.green))),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.red),
                )))
      ])),
      backgroundColor: Colors.grey[400],
    );
  }

  Widget _buildIcon(Contact index) {
    checkMutualContact(index.name);

    if (checkMutualContact(index.name) == true) {
      return Icon(Icons.remove);
    } else {
      return Icon(Icons.add);
    }
  }
}
