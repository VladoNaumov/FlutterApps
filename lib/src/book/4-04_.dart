import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

// Основной класс приложения, наследуется от StatelessWidget (неизменяемый виджет)
class MyApp extends StatelessWidget {
  // Конструктор с ключом для идентификации виджета
  const MyApp({super.key});

  // Метод build определяет структуру пользовательского интерфейса
  @override
  Widget build(BuildContext context) {
    // MaterialApp - корневой виджет приложения, задает основные настройки
    return MaterialApp(
      title: 'GridView Demo', // Заголовок приложения для системного интерфейса
      theme: ThemeData(
        useMaterial3: true, // Включаем Material 3 для современного дизайна (совместимо с Flutter 3.32.0)
      ),
      home: Scaffold(
        // Scaffold - базовая структура экрана с поддержкой Material Design
        body: GridView.count(
          // GridView.count - создает сетку с фиксированным количеством столбцов
          padding: EdgeInsets.all(4.0), // Отступы 4 пикселя со всех сторон
          crossAxisCount: 4, // Количество столбцов в сетке (4 столбца)
          childAspectRatio: 1.0, // Соотношение ширины к высоте ячеек (1:1, квадратные ячейки)
          mainAxisSpacing: 4.0, // Расстояние между строками (4 пикселя)
          crossAxisSpacing: 4.0, // Расстояние между столбцами (4 пикселя)
          // Список ячеек сетки
          children: [
            // GridTile - виджет для ячейки сетки
            GridTile(child: FlutterLogo()), // Логотип Flutter в первой ячейке
            GridTile(child: FlutterLogo()), // Логотип Flutter во второй ячейке
            GridTile(child: FlutterLogo()), // и т.д.
            GridTile(child: FlutterLogo()),
            GridTile(child: FlutterLogo()),
            GridTile(child: FlutterLogo()),
            GridTile(child: FlutterLogo()),
            GridTile(child: FlutterLogo()),
            GridTile(child: FlutterLogo()),
          ],
        ),
      ),
    );
  }
}

/*
Этот код создает простое Flutter-приложение, которое отображает экран с сеткой (GridView.count), содержащей 9 ячеек, каждая из которых отображает логотип Flutter (FlutterLogo). Сетка организована следующим образом:
Структура сетки:
4 столбца (crossAxisCount: 4).

Ячейки квадратные (childAspectRatio: 1.0).

Отступы 4 пикселя вокруг сетки (padding) и между ячейками (mainAxisSpacing, crossAxisSpacing).

Содержимое:
Каждая ячейка содержит логотип Flutter, обернутый в GridTile.

Общая структура:
Приложение использует MaterialApp для настройки и Scaffold для базовой структуры экрана.

Сетка занимает весь экран, отображая логотипы в упорядоченной сетке 4x3 (9 ячеек заполнены, остальные остаются пустыми, если их больше).

Методы и виджеты: За что отвечают
MaterialApp:
Корневой виджет приложения, задает настройки, такие как заголовок (title), тема (theme) и начальный экран (home).

title: отображается в системном интерфейсе (например, в панели задач).

theme: задает глобальную тему (здесь включен Material 3 через useMaterial3: true).

home: определяет главный экран приложения.

ThemeData:
Определяет тему приложения.

useMaterial3: true: включает стили Material 3, совместимые с Flutter 3.32.0.

Scaffold:
Предоставляет базовую структуру экрана Material Design.

body: содержит основной контент (здесь GridView.count).

GridView.count:
Виджет для создания сетки с фиксированным количеством столбцов.

crossAxisCount: задает количество столбцов (здесь 4).

childAspectRatio: определяет соотношение ширины к высоте ячеек (1:1 для квадратных ячеек).

padding: задает отступы вокруг сетки (4 пикселя).

mainAxisSpacing: расстояние между строками (4 пикселя).

crossAxisSpacing: расстояние между столбцами (4 пикселя).

children: список виджетов для ячеек сетки.

GridTile:
Виджет для ячейки сетки.

child: содержимое ячейки (здесь FlutterLogo).

FlutterLogo:
Встроенный виджет, отображающий логотип Flutter (графический элемент для демонстрации).
* */