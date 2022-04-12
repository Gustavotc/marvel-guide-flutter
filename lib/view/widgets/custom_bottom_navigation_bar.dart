import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final void Function(int) onItemTapped;
  const CustomBottomNavigationBar({ Key? key, required this.onItemTapped }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
    int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          onTap: (index) {
            widget.onItemTapped(index);
            setState(() {
              _selectedIndex = index;
            });
          }
        );
  }
}