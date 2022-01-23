import 'package:flutter/material.dart';
import 'package:project_test/home_page.dart';
import 'package:project_test/notes_page.dart';
import 'package:project_test/profile_page.dart';
import 'package:project_test/bookmark_page.dart';

class BotNavigation extends StatelessWidget {
  const BotNavigation({Key? key}) : super(key: key);

  // static const String _title = 'ITUTORPOCKET';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // title: _title,
      home: Navigation(),
    );
  }
}
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  
  int _selectedIndex = 0;
  final List<Widget> _children =
  [
    const HomePage(),
    const NotesPage(),
    const BookmarkPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITUTORPOCKET'),
        backgroundColor: Colors.greenAccent,
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // onTap: onTappedBar,
        // selectedIndex: _selectedIndex,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.greenAccent,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}
