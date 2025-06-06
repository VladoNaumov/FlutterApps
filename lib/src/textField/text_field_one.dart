/*
Показывает поле ввода (TextField) с рамкой и подсказкой.
При каждом изменении текста в консоли появляется сообщение:
Пользователь ввёл: ....
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пример TextField',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField пример'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NameInputField(),
        ),
      ),
    );
  }
}
// Padding добавляет отступы.
// NameInputField() — пользовательский виджет, в котором находится TextField.

class NameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Введите имя',
        hintText: 'Иван Иванов',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) {
        print('Пользователь ввёл: $text');
      },
    );
  }
}

/*

TextField — поле ввода текста.
decoration: — отвечает за оформление.
labelText: Метка, которая сдвигается вверх, когда пользователь начинает ввод.
hintText: Светлая подсказка внутри поля.
border: OutlineInputBorder() : Добавляет рамку вокруг поля.
* */
