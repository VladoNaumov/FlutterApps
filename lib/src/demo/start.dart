import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// базовая структура экрана
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // базовая структура экрана
        appBar: AppBar(title: Text('Пример')), // Верхняя панель.
        body: Center(child: Text('Привет, Flutter!')),
      ),
    );
  }
}

// базовая структура экрана + AppBar Color
class MyAppAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( // AppBar Верхняя панель.
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
        ),
      ),

      // это можно перенести в отдельный класс (удобство чтение )
      home: Scaffold( // базовая структура экрана
        appBar: AppBar(title: Text('Заголовок')),
        body: Center(child: Text('Привет, Flutter!')),
      ),
    );
  }
}

// базовая структура экрана + AppBar Color + class
class MyAppAppBar_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(), // вызов class MyHomePage
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // базовая структура экрана
      appBar: AppBar(
        title: Text('Заголовок'),
      ),
      body: Center(
        child: Text('Привет, мир!'),
      ),
    );
  }
}