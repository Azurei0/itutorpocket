import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_courselist.dart';
import 'package:project_test/ContentProvider/cp_profilepage.dart';

class CPBotNavigationWidget extends StatefulWidget {
  const CPBotNavigationWidget({Key? key}) : super(key: key);

  @override
  _CPBotNavigationWidgetState createState() => _CPBotNavigationWidgetState();
}

class _CPBotNavigationWidgetState extends State<CPBotNavigationWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    CPCourseList(),
    CPProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Course',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
