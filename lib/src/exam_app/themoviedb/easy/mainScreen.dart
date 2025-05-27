// Простой экран после логина
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTab = 0;

  static const List<Widget> widgetOptions = <Widget>[
    Text('News', style: TextStyle(fontSize: 24)),
    Text('Films', style: TextStyle(fontSize: 24)),
    Text('Series', style: TextStyle(fontSize: 24)),
  ];

  void onSelectTab(int index) {
    if (selectedTab == index) return;
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Main Screen')
      ),
      body: Center(
        child: widgetOptions[selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: onSelectTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Series',
          ),
        ],
      ),
    );
  }
}