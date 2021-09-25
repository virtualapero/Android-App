import 'package:flutter/material.dart';

import 'index/aperos.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.wine_bar),
        label: "Apéros"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.link),
        label: "Links"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.apps),
        label: "Projekte"
    )
  ];
  final List<Widget> _widgetOptions = const <Widget>[
    HomeAperosView(),
    Text(
      'Links',
    ),
    Text(
      'Projekte',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}