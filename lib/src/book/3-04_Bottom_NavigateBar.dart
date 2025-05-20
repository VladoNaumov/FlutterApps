// Импортируем библиотеку Flutter для создания интерфейса приложения
import 'package:flutter/material.dart';

// Точка входа в приложение — функция main запускает приложение
void main() => runApp(MyApp());

// Класс MyApp — главный виджет приложения, наследуется от StatefulWidget (виджет с изменяемым состоянием)
class MyApp extends StatefulWidget {
  @override
  // Создаём состояние для MyApp
  _MyAppState createState() => _MyAppState();
}

// Класс _MyAppState управляет состоянием виджета MyApp
class _MyAppState extends State<MyApp> {
  // Переменная для хранения индекса текущей выбранной вкладки
  int _selectedIndex = 0;

  // Список страниц, отображаемых при выборе вкладок
  final List<Widget> _pages = [
    Center(child: Text("Announcements")), // Страница для вкладки "Announcements"
    Center(child: Text("Messages")), // Страница для вкладки "Messages"
    Center(child: Text("Profile")), // Страница для вкладки "Profile"
  ];

  // Метод, вызываемый при нажатии на элемент нижней панели навигации
  void _onItemTapped(int index) {
    setState(() {
      // Обновляем _selectedIndex для переключения страницы
      _selectedIndex = index;
    });
  }

  @override
  // Метод build определяет, как будет выглядеть экран
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp — основной виджет для создания приложения с дизайном Material
      home: Scaffold(
        // Scaffold задаёт структуру экрана
        appBar: AppBar(
          title: Text("BottomNavigationBar Demo"), // Заголовок в верхней панели
        ),
        // Отображаем страницу, соответствующую текущему индексу
        body: _pages[_selectedIndex],
        // Нижняя панель навигации
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, // Текущая активная вкладка
          onTap: _onItemTapped, // Обработчик нажатий на вкладки
          items: [
            // Элемент 1: Вкладка "Announcements"
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement), // Иконка вкладки
              label: "Announcements", // Текст под иконкой
            ),
            // Элемент 2: Вкладка "Messages"
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            // Элемент 3: Вкладка "Profile"
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

/*
Этот код создаёт Flutter-приложение с нижней панелью навигации (BottomNavigationBar), содержащей три вкладки: "Announcements", "Messages" и "Profile". Каждая вкладка отображает соответствующую страницу с текстом в центре экрана. Переключение между страницами осуществляется через изменение индекса _selectedIndex с помощью setState.
Разбор ключевых компонентов
Точка входа (main):
Функция main запускает приложение, вызывая runApp с виджетом MyApp.

Класс MyApp и StatefulWidget:
MyApp наследуется от StatefulWidget, так как интерфейс должен обновляться при переключении вкладок (изменение _selectedIndex).

Состояние управляется в классе _MyAppState.

Переменные состояния:
_selectedIndex: Целое число (int), хранящее индекс текущей активной вкладки (0, 1 или 2). Изначально равно 0 (вкладка "Announcements").

_pages: Список виджетов, представляющих страницы для каждой вкладки. Каждая страница — это Center с текстом.

Метод _onItemTapped:
Вызывается при нажатии на вкладку в BottomNavigationBar.

Обновляет _selectedIndex через setState, что приводит к перерисовке интерфейса с отображением новой страницы.

Метод build:
Создаёт интерфейс с помощью MaterialApp и Scaffold.

appBar отображает заголовок "BottomNavigationBar Demo".

body отображает страницу из списка _pages, соответствующую _selectedIndex.

bottomNavigationBar содержит BottomNavigationBar с тремя вкладками.

Виджет BottomNavigationBar:
Свойство currentIndex указывает текущую активную вкладку (синхронизировано с _selectedIndex).

onTap вызывает _onItemTapped при нажатии на вкладку, передавая индекс выбранной вкладки.

items: Список из трёх BottomNavigationBarItem, каждый из которых содержит иконку (icon) и метку (label).

Что делает приложение
Показывает экран с заголовком "BottomNavigationBar Demo" в верхней панели (AppBar).

В нижней части экрана отображается панель навигации с тремя вкладками: "Announcements", "Messages" и "Profile".

Каждая вкладка имеет иконку и текст. При нажатии на вкладку отображается соответствующая страница с текстом в центре:
Вкладка 1: "Announcements".

Вкладка 2: "Messages".

Вкладка 3: "Profile".

Переключение между вкладками обновляет содержимое экрана.


**/