// TODO  "easy version UI interface Login and Password"

// Простой экран -
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

/*
** BottomNavigationBarTheme- Тема оформления для BottomNavigationBar, определяющая такие параметры, как цвет фона, цвет иконок, выделение и стиль текста
** Scaffold -  предоставляющий структуру пользовательского интерфейса — включает AppBar, тело (body), нижнюю панель (bottomNavigationBar) и другие элементы.
** Widget[] - Список (массив) виджетов. Обычно используется в children параметрах, где требуется передать несколько виджетов.
** AppBar - Панель приложения в верхней части экрана. Содержит заголовок, иконки действий и другие элементы управления.
** Center - Виджет, выравнивающий своего потомка (child) по центру родительского контейнера как по горизонтали, так и по вертикали.
** BottomNavigationBarItem - Свойство темы (ThemeData), позволяющее глобально настроить стилизацию BottomNavigationBar для всего приложения.
** StatefulWidget** — виджет с внутренним состоянием, может изменяться.
* */