// используется TextEditingController для управления текстом в TextField

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextEditingController пример',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Контроллер текста'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NameInputWithController(),
        ),
      ),
    );
  }
}
// Padding: добавляет отступы.

class NameInputWithController extends StatefulWidget {
  @override
  _NameInputWithControllerState createState() => _NameInputWithControllerState();
}

class _NameInputWithControllerState extends State<NameInputWithController> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // Освобождаем ресурсы при уничтожении
    super.dispose();
  }

  void _showInput() {
    final text = _controller.text;
    print('Введённый текст: $text');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Вы ввели: $text')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Введите имя',
            hintText: 'Иван Иванов',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _showInput,
          child: Text('Показать введённый текст'),
        ),
      ],
    );
  }
}

// Позволяет управлять содержимым TextField.
// Получаем текст: _controller.text
// Можно очистить: _controller.clear()
// В dispose(); свобождает ресурсы контроллера, когда виджет уничтожается. Обязателен при использовании TextEditingController в StatefulWidget.
// controller: — указывает, что это поле связано с _controller, т.е. мы можем читать текст из него в любой момент.

// InputDecoration добавляет:
// labelText — метку ("Введите имя")
// hintText — серую подсказку внутри поля ("Иван Иванов")
// border: — рамку.

