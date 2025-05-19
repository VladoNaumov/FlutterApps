// Импортируем библиотеку Flutter для работы с виджетами Material Design.
import 'package:flutter/material.dart';

void main() => runApp(MyAppAppBar());

/* DEMO I базовая структура экрана */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold нужен для отображения базовой структуры экрана (AppBar, body и др.)
      home: Scaffold(
        appBar: AppBar(title: Text('Пример')), // Верхняя панель.
        body: Center(child: Text('Привет, Flutter!')),
      ),
    );
  }
}

/* DEMO II  базовая структура экрана с темой и AppBar */
class MyAppAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Указываем тему приложения.
      theme: ThemeData( // Настройка темы, в частности AppBar.
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange, // Цвет фона верхней панели (AppBar).
        ),
      ),

      // Главный экран приложения.
      home: Scaffold( // Scaffold нужен для отображения базовой структуры экрана (AppBar, body и др.)
        appBar: AppBar( // Верхняя панель приложения.
          title: Text('Заголовок'), // Заголовок в AppBar.
        ),
        body: Center( // Тело экрана. Центрирует дочерний виджет.
          child: Text('Привет, Flutter!'), // Отображение текста по центру.
        ),
      ),
    );
  }
}

/*
MaterialApp — всё приложение.
ThemeData — настройка внешнего вида (например, цвет AppBar).
Scaffold — нужен для отображения базовой структуры экрана (AppBar, body и др.)
AppBar — верхняя панель.
Center + Text — содержимое в центре экрана.
*/

/* DEMO III Главное приложение с темой и AppBar */
class MyAppAppBar_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(),  // Главная страница
    );
  }
}

// Главная страница
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заголовок'),
      ),
      body: Center(
        child: Text('Привет, мир!'),
      ),
    );
  }
}

