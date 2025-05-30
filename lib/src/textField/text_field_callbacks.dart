/* Flutter у виджета `TextField` есть несколько важных колбэков (методов обратного вызова),
// которые позволяют отслеживать действия пользователя при вводе текста.


### Основные колбэки `TextField`:

| Колбэк              | Описание                                                                       |
| ------------------- | ------------------------------------------------------------------------------ |
| `onChanged`         | Вызывается каждый раз, когда меняется текст.                                   |
| `onEditingComplete` | Вызывается при завершении редактирования (обычно когда нажата клавиша "done"). |
| `onSubmitted`       | Вызывается, когда пользователь нажимает "Enter" (или "done" на клавиатуре).    |
| `onTap`             | Вызывается при нажатии на поле ввода.                                          |

*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentText = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField Колбэки')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,

              // Вызывается каждый раз при изменении текста
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
                print('onChanged: $value');
              },

              // Вызывается при завершении редактирования (например, фокус ушел)
              onEditingComplete: () {
                print('onEditingComplete (редактирование завершено)');
              },

              // Вызывается при нажатии "Enter" или "done" на клавиатуре
              onSubmitted: (value) {
                print('onSubmitted: $value');
              },

              // Вызывается при нажатии на поле ввода
              onTap: () {
                print('onTap (нажатие на TextField)');
              },

              decoration: const InputDecoration(
                labelText: 'Введите текст',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Text('Текущий текст: $currentText'),
          ],
        ),
      ),
    );
  }
}


/*
###  Как это работает:

* При **наборе текста** — вызывается `onChanged`.
* Когда пользователь **нажимает на TextField** — вызывается `onTap`.
* Когда пользователь **нажимает "Enter" / "Done"** — сначала вызывается `onEditingComplete`, потом `onSubmitted`.
* Все действия можно отслеживать через `print()` или обновление UI через `setState`.

 */

