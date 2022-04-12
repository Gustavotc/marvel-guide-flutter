import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../about/about_screen.dart';
import '../home/home_screen.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Quadrinhos',
    ),
    Text(
      'Buscar',
    ),
    AboutScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Heróis',
                backgroundColor: AppColors.black),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp),
              label: 'Quadrinhos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Info',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.red,
          unselectedItemColor: Colors.white70,
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
