import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

import 'ChatScreen.dart';
import 'assignments_screen.dart';
import 'contact_screen.dart';
import 'notifications_screen.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);


  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  List pages = [
    ChatScreen(),
    Screen1(),
    AssignmentsScreen(),
    NotificationsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //change the icon and label to match what each page should be
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.white38,
        selectedItemColor: Colors.white,
        backgroundColor: StyleConstants.black,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
