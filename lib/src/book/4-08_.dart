import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget  {

  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(home : Scaffold(
      body : Center(child :
        PopupMenuButton(
          onSelected : (String result) { print(result); },
          itemBuilder : (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem(value : "copy", child : Text("Copy")),
            PopupMenuItem(value : "cut", child : Text("Cut")),
            PopupMenuItem(value : "paste", child : Text("Paste"))
          ]
        )
      )

    ));
  }

}

/*
Этот код создает простое Flutter-приложение, которое отображает экран с одной кнопкой всплывающего меню (PopupMenuButton) в центре (Center). Основные характеристики:
Всплывающее меню:
При нажатии на кнопку открывается меню с тремя пунктами: "Copy", "Cut", "Paste".

Каждый пункт имеет значение (value), которое передается в обработчик onSelected.

При выборе пункта меню в консоль выводится соответствующее значение (copy, cut, или paste).

Структура:
Приложение использует MaterialApp для настройки и Scaffold для базовой структуры экрана.

PopupMenuButton расположен в центре экрана с помощью Center.

Цель: Демонстрирует использование PopupMenuButton для создания всплывающего меню с интерактивными пунктами.

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

body: содержит основной контент (здесь Center с PopupMenuButton).

Center:
Центрирует дочерний виджет по горизонтали и вертикали.

PopupMenuButton:
Виджет, создающий кнопку, которая открывает всплывающее меню.

onSelected: обработчик, вызываемый при выборе пункта меню, принимает значение (value) выбранного пункта.

itemBuilder: функция, возвращающая список пунктов меню (PopupMenuEntry).

PopupMenuItem:
Элемент всплывающего меню.

value: значение, передаваемое в onSelected при выборе пункта.

child: виджет, отображаемый в меню (здесь Text).

Text:
Отображает текст в пунктах меню ("Copy", "Cut", "Paste").

* */