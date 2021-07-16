import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/contact_model.dart';
import 'package:kyros_app_mobile/models/contacts.dart';


class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String searchInput = '';
  List display_contacts = contacts;

  void search() {
    setState(() {
      display_contacts.clear();
    });
    for (var i = 0; i < contacts.length; i++) {
      if (contacts[i].name.contains(searchInput)) {
        setState(() {
          display_contacts.add(contacts[i]);
          print(display_contacts);
        });
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          width: 300,
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
                hintStyle: TextStyle(fontSize:16),
                filled: true,
                contentPadding: EdgeInsets.all(10),
                fillColor: Colors.white
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
            children: [
              for (var item = 0; item < display_contacts.length; item ++)
                Contact_Box(index: item)
            ]

        ),

      ),
      backgroundColor: Colors.grey[400],
    );
  }
}
