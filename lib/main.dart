import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/screens/ChatScreen.dart';
import 'package:kyros_app_mobile/screens/contact_screen.dart';
import 'package:kyros_app_mobile/screens/assignments_screen.dart';
import 'package:kyros_app_mobile/screens/notifications_screen.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyros Mobile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //change appbar title here, or remove the appbar entirely
      home: MyHomePage(title: 'Kyros Mobile App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
