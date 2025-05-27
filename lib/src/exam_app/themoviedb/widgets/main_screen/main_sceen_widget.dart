// TODO : Main Screen (BottomNavigationBar)
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});
  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int selsctTab = 0;

  static const List<Widget> widgetOPtions =<Widget>[

    Text('Новости', style: TextStyle(fontSize: 24)),
    Text('Фильмы', style: TextStyle(fontSize: 24)),
    Text('Сериалы', style: TextStyle(fontSize: 24)),

  ];
  void onSelectTab(int value) {
    if(selsctTab == value) return;
    setState(() {
      selsctTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('data'),
        ),
      body: Center(
        child: widgetOPtions [selsctTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
         currentIndex:selsctTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}