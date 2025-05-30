/* **как управлять `TextField` через `TextEditingController` и обрабатывать события**.

Контроллер позволяет:

* Получать и изменять текст программно.
* Следить за изменениями текста (аналогично `onChanged`, но через слушатель).
* Управлять курсором, выделением, и очищать поле.

*/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyControllerExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyControllerExample extends StatefulWidget {
  const MyControllerExample({super.key});

  @override
  State<MyControllerExample> createState() => _MyControllerExampleState();
}

class _MyControllerExampleState extends State<MyControllerExample> {
  final TextEditingController _controller = TextEditingController();
  String _controllerText = '';

  @override
  void initState() {
    super.initState();

    // Подписываемся на изменения текста через контроллер
    _controller.addListener(() {
      setState(() {
        _controllerText = _controller.text;
      });
      print('Контроллер изменился: ${_controller.text}');
    });
  }

  @override
  void dispose() {
    // Важно очищать контроллер при удалении виджета
    _controller.dispose();
    super.dispose();
  }

  void _clearText() {
    _controller.clear(); // Очищает поле ввода
  }

  void _setText() {
    _controller.text = 'Пример текста'; // Программно задаёт текст
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    ); // Перемещает курсор в конец
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextEditingController')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Введите текст',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text('Текст из контроллера: $_controllerText'),

            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _clearText,
                  child: const Text('Очистить'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _setText,
                  child: const Text('Записать текст'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/*
## ✅ Что демонстрирует пример:

| Функция                      | Что делает                          |
| ---------------------------- | ----------------------------------- |
| `addListener()`              | Реагирует на любые изменения текста |
| `_controller.clear()`        | Очищает текст                       |
| `_controller.text = ...`     | Задаёт текст программно             |
| `TextSelection.fromPosition` | Управляет курсором                  |

 */
