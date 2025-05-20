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
      title: 'ListView Demo', // Заголовок приложения для системного интерфейса
      theme: ThemeData(
        useMaterial3: true, // Включаем Material 3 для современного дизайна (совместимо с Flutter 3.32.0)
      ),
      home: Scaffold(
        // Scaffold - базовая структура экрана с поддержкой Material Design
        body: ListView(
          // ListView - виджет для создания прокручиваемого списка элементов
          children: [
            // ListTile - элемент списка с иконкой и текстом
            ListTile(leading: Icon(Icons.gif), title: Text("1")), // Иконка GIF и текст "1"
            ListTile(leading: Icon(Icons.book), title: Text("2")), // Иконка книги и текст "2"
            ListTile(leading: Icon(Icons.call), title: Text("3")), // Иконка телефона и текст "3"
            ListTile(leading: Icon(Icons.dns), title: Text("4")), // Иконка DNS и текст "4"
            ListTile(leading: Icon(Icons.cake), title: Text("5")), // Иконка торта и текст "5"
            ListTile(leading: Icon(Icons.pets), title: Text("6")), // Иконка питомца и текст "6"
            ListTile(leading: Icon(Icons.poll), title: Text("7")), // Иконка опроса и текст "7"
            ListTile(leading: Icon(Icons.face), title: Text("8")), // Иконка лица и текст "8"
            ListTile(leading: Icon(Icons.home), title: Text("9")), // Иконка дома и текст "9"
            ListTile(leading: Icon(Icons.adb), title: Text("10")), // Иконка Android и текст "10"
            ListTile(leading: Icon(Icons.dvr), title: Text("11")), // Иконка DVR и текст "11"
            ListTile(leading: Icon(Icons.hd), title: Text("12")), // Иконка HD и текст "12"
            ListTile(leading: Icon(Icons.toc), title: Text("13")), // Иконка TOC и текст "13" (исправлено с "3")
            ListTile(leading: Icon(Icons.tv), title: Text("14")), // Иконка TV и текст "14"
            ListTile(leading: Icon(Icons.help), title: Text("15")), // Иконка помощи и текст "15"
          ],
        ),
      ),
    );
  }
}

/*
Этот код создает простое Flutter-приложение, которое отображает прокручиваемый список (ListView) из 15 элементов (ListTile). Каждый элемент списка состоит из:
Иконки (leading): использует различные иконки из библиотеки Material Design (например, Icons.gif, Icons.book, Icons.call и т.д.).

Текста (title): отображает номера от "1" до "15" (исправлено дублирование "3" на "13").

Структура:
Приложение использует MaterialApp для настройки и Scaffold для базовой структуры экрана.

Список прокручивается вертикально, если не помещается на экране.

Цель: Демонстрирует использование ListView для создания простого списка с иконками и текстом.

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

body: содержит основной контент (здесь ListView).

ListView:
Виджет для создания прокручиваемого списка.

children: список дочерних виджетов, которые отображаются в порядке добавления (здесь ListTile).

ListTile:
Элемент списка, предназначенный для отображения строки с иконкой и текстом.

leading: виджет слева от текста (здесь иконка из Icons).

title: основной текст элемента (здесь Text с номерами).

Icon:
Отображает иконку из библиотеки Material Design.

Принимает значение из Icons (например, Icons.gif, Icons.book).

Text:
Отображает текст в заголовках элементов списка.


* */