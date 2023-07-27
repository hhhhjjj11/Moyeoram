import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:youngjun/common/const/colors.dart';
import './title_bar.dart';

class MainNav extends StatefulWidget {
  const MainNav({
    super.key,
    required this.bodyWidgets,
    required this.appBar,
  });
  final List<Widget> bodyWidgets;
  final PreferredSizeWidget appBar;
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: widget.bodyWidgets.elementAt(_selectedIndex),
      ),
      bottomSheet: BottomNavigationBar(
        iconSize: 35.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MAIN_COLOR,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: BACKGROUND_COLOR,
      ),
    );
  }
}
