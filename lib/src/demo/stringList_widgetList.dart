// Demonstration of converting a list of strings into a list of widgets
// (демонстрация превращение списка строк в список виджетов).

import 'package:flutter/material.dart';


void main() => runApp(const AppExample());

/// Главный виджет приложения
class AppExample extends StatelessWidget {
  const AppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App', // Название приложения
      theme: ThemeData(
        primarySwatch: Colors.blue, // Основная цветовая схема
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColor, // Цвет AppBar из темы
        ),
      ),
      home: Example(), // Основной экран
    );
  }
}

/// Класс для хранения пары строк
class TwoString {
  final String first;
  final String second;

  TwoString({
    required this.first,
    required this.second,
  });
}

/// Виджет, отображающий список пар строк
class Example extends StatelessWidget {
  // Список данных для отображения
  final List<TwoString> textData = [
    TwoString(first: 'Hello', second: 'World'),
    TwoString(first: 'Hello', second: 'Flutter'),
    TwoString(first: 'Hello', second: 'Dart'),
    TwoString(first: 'Hello', second: 'Android'),
    TwoString(first: 'Hello', second: 'iOS'),
  ];

  Example({super.key});

  @override
  Widget build(BuildContext context) {
    // Преобразуем список данных в список виджетов
    /* final List<Widget> testField = textData
        .map((TwoString twoString) => TextWrapper(text: twoString))
        .toList();

     */

    // Создаём список виджетов вручную через цикл
    final List<Widget> testField = [];
    for (var data in textData) {
      final widget = TextWrapper(text: data); // Оборачиваем каждую пару в виджет
      testField.add(widget); // Добавляем в список
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Example')), // Верхняя панель с заголовком
      body: Padding(
        padding: const EdgeInsets.all(16), // Внешний отступ
        child: ListView(
          children: testField, // Отображаем список виджетов
        ),
      ),
    );
  }
}

/// Виджет, отображающий одну пару строк
class TextWrapper extends StatelessWidget {
  final TwoString text;

  const TextWrapper({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // Отступ между строками
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Равномерное распределение
        children: [
          Text(
            text.first,
            style: TextStyle(fontSize: 30), // Стиль текста
          ),
          Text(
            text.second,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
