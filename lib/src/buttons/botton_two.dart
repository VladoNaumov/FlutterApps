import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ButtonStyle Example'), // Заголовок приложения
          backgroundColor: Colors.teal, // Цвет верхней панели
        ),
        body: ButtonExamples(),
      ),
    );
  }
}

class ButtonExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Отступы по краям экрана
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Равномерное расположение кнопок
        children: [
          // 1. ElevatedButton с ButtonStyle
          ElevatedButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата ElevatedButton!');
            },
            style: ButtonStyle(
              // Цвет фона кнопки
              backgroundColor: WidgetStateProperty.all(Colors.teal),
              // Цвет текста или иконки
              foregroundColor: WidgetStateProperty.all(Colors.white),
              // Тень кнопки
              elevation: WidgetStateProperty.all(5),
              // Отступы внутри кнопки
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              // Форма кнопки (закругленные углы)
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Размер текста (через стиль текста)
              textStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            child: Text('ElevatedButton'),
          ),

          // 2. OutlinedButton с ButtonStyle
          OutlinedButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата OutlinedButton!');
            },
            style: ButtonStyle(
              // Цвет контура кнопки
              side: WidgetStateProperty.all(
                BorderSide(color: Colors.teal, width: 2),
              ),
              // Цвет текста
              foregroundColor: WidgetStateProperty.all(Colors.teal),
              // Отступы внутри кнопки
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              // Форма кнопки (закругленные углы)
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Размер текста
              textStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 16),
              ),
            ),
            child: Text('OutlinedButton'),
          ),

          // 3. TextButton с ButtonStyle
          TextButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата TextButton!');
            },
            style: ButtonStyle(
              // Цвет текста
              foregroundColor: WidgetStateProperty.all(Colors.teal),
              // Отступы внутри кнопки
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              // Стиль текста (подчеркивание)
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            child: Text('TextButton'),
          ),

          // 4. IconButton с ButtonStyle (ограниченная кастомизация)
          IconButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата IconButton!');
            },
            icon: Icon(Icons.favorite),
            // У IconButton нет полного ButtonStyle, но можно задать некоторые свойства
            style: ButtonStyle(
              // Цвет иконки
              foregroundColor: WidgetStateProperty.all(Colors.red),
              // Размер иконки задается отдельно
            ),
            iconSize: 40, // Размер иконки
            tooltip: 'Нажми на сердце', // Подсказка
          ),
        ],
      ),
    );
  }
}

/*
Объяснение кода и ButtonStyle:
Что такое ButtonStyle?
  ButtonStyle — это класс во Flutter, который позволяет настраивать внешний вид кнопок.
  Он использует WidgetStateProperty для задания свойств, которые могут меняться в зависимости от состояния кнопки (нажата, активна, неактивна и т.д.).
  В примере я использую WidgetStateProperty.all, чтобы задать одинаковые значения для всех состояний (для простоты).
ElevatedButton:
  Использует ButtonStyle для задания:
  backgroundColor: Цвет фона (бирюзовый).
  foregroundColor: Цвет текста (белый).
  elevation: Тень для эффекта "приподнятости".
  padding: Отступы внутри кнопки.
  shape: Закругленные углы через RoundedRectangleBorder.
  textStyle: Размер и стиль текста.
При нажатии выводится сообщение в консоль.
OutlinedButton:
  Использует ButtonStyle для:
  side: Задаёт контур (цвет и толщина).
  foregroundColor: Цвет текста.
  padding и shape: Отступы и закругленные углы.
  textStyle: Размер текста.
  Простой стиль с бирюзовым контуром.
TextButton:
  Использует ButtonStyle для:
  foregroundColor: Цвет текста.
  padding: Отступы.
  textStyle: Размер текста и подчеркивание для эффекта ссылки.
  Минималистичная текстовая кнопка.
IconButton:
  У IconButton поддержка ButtonStyle ограничена, но можно задать foregroundColor для цвета иконки.
  Размер иконки задаётся через iconSize, а подсказка — через tooltip.
  Как это выглядит:
ElevatedButton: Бирюзовая кнопка с белым текстом, тенью и закругленными углами.
OutlinedButton: Кнопка с бирюзовым контуром и текстом, тоже с закруглениями.
TextButton: Текст с подчеркиванием, как ссылка.
IconButton: Красное сердце, с подсказкой при наведении.
*/