import 'package:flutter/material.dart';

import 'Home_page.dart';
import 'Profile_Page.dart';
import 'menu_page.dart';

class Navigater extends StatefulWidget {
  const Navigater({super.key});

  @override
  State<Navigater> createState() => _NavigaterState();
}

class _NavigaterState extends State<Navigater> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    MenuPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          )
        ],
      ),
    );
  }
}
