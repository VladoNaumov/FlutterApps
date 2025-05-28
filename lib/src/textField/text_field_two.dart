// используется TextEditingController для управления текстом в TextField

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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

/*
Объяснение:
TextEditingController управляет текстом поля.
Метод _showInput() читает текст и отображает его через SnackBar и в консоли.
В dispose() обязательно освобождаем контроллер, чтобы избежать утечки памяти.
* */