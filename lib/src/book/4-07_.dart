// Импортируем библиотеку Flutter для работы с виджетами и Material Design
import 'package:flutter/material.dart';

// Точка входа в приложение: запускает приложение, вызывая MyApp
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
      title: 'FloatingActionButton Demo', // Заголовок приложения для системного интерфейса
      theme: ThemeData(
        useMaterial3: true, // Включаем Material 3 для современного дизайна (совместимо с Flutter 3.32.0)
      ),
      home: Scaffold(
        // Scaffold - базовая структура экрана с поддержкой Material Design
        floatingActionButton: FloatingActionButton(
          // FloatingActionButton - плавающая кнопка действия
          backgroundColor: Colors.red, // Красный фон кнопки
          foregroundColor: Colors.yellow, // Желтый цвет иконки и текста
          child: Icon(Icons.add), // Иконка "плюс" внутри кнопки
          onPressed: () {
            // Обработчик нажатия кнопки, выводит сообщение в консоль
            print("Ouch! Stop it!");
          },
        ),
        // Center - центрирует дочерний виджет по горизонтали и вертикали
        body: Center(
          child: Text("Click it!"), // Текст "Click it!" в центре экрана
        ),
      ),
    );
  }
}
/*
Этот код создает простое Flutter-приложение, которое отображает экран с:
Текстом в центре:
Текст "Click it!" отображается в центре экрана с помощью Center и Text.

Плавающей кнопкой:
Плавающая кнопка действия (FloatingActionButton) с красным фоном и желтой иконкой "плюс" (Icons.add) расположена в правом нижнем углу экрана (по умолчанию для Scaffold).

При нажатии на кнопку в консоль выводится сообщение "Ouch! Stop it!".

Структура:
Приложение использует MaterialApp для настройки и Scaffold для базовой структуры экрана.

Цель: демонстрация использования FloatingActionButton для создания интерактивной кнопки с обработкой нажатий.

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

floatingActionButton: задает плавающую кнопку действия, которая отображается поверх содержимого.

body: содержит основной контент (здесь Center с Text).

Center:
Центрирует дочерний виджет по горизонтали и вертикали.

Text:
Отображает текст ("Click it!") в центре экрана.

FloatingActionButton:
Плавающая кнопка действия, обычно используется для основного действия на экране.

backgroundColor: задает цвет фона кнопки (здесь Colors.red).

foregroundColor: задает цвет иконки или текста (здесь Colors.yellow).

child: содержимое кнопки (здесь иконка Icons.add).

onPressed: обработчик нажатия кнопки, выполняет указанную функцию (здесь выводит сообщение в консоль).

Icon:
Отображает иконку из библиотеки Material Design (здесь Icons.add — значок "плюс").

* */
