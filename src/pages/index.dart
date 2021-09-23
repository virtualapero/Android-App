import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {

  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.wine_bar),
        label: "Apéros"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.link),
        label: "Links"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.apps),
        label: "Projekte"
    )
  ];
  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Apéros',
    ),
    const Text(
      'Links',
    ),
    const Text(
      'Projekte',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: _widgetOptions.elementAt(_selectedIndex),
          onTap: () => {
            Navigator.of(context).pushNamed('asd')
          },
        ),
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