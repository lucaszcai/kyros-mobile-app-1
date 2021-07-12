import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/screens/chat_screen.dart';
import 'package:kyros_app_mobile/screens/contact_screen.dart';
import 'package:kyros_app_mobile/screens/assignments_screen.dart';
import 'package:kyros_app_mobile/screens/notifications_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //change appbar title here, or remove the appbar entirely
      home: MyHomePage(title: '4 Page Template'),
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

  List pages = [ChatScreen(), ContactsScreen(), AssignmentsScreen(), NotificationsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //change the icon and label to match what each page should be
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '1'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '2'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '3'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '4'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.black38,
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
