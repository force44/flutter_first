import 'package:flutter/material.dart';
import 'package:lotto/tabs/tab_luck.dart';
import 'tabs/tab_home.dart';
import 'tabs/tab_search.dart';
import 'tabs/tab_profile.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});
  @override
  IndexScreenState createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    TabHome(),
    //TabSearch(),
    TabLuck(),
    TabProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blueAccent, title: const Text('WIN')),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 34,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
         // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.recommend), label: 'luck'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'history'),
        ],
      ),
    );
  }
}