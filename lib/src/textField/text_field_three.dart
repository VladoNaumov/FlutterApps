// Используется TextEditingController
// Есть кнопка очистки
// Поле получает фокус автоматически при запуске

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField расширенный пример',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField с контроллером'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NameInputAdvanced(),
        ),
      ),
    );
  }
}

class NameInputAdvanced extends StatefulWidget {
  @override
  _NameInputAdvancedState createState() => _NameInputAdvancedState();
}

class _NameInputAdvancedState extends State<NameInputAdvanced> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Устанавливаем фокус при запуске
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showInput() {
    final text = _controller.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Вы ввели: $text')),
    );
  }

  void _clearInput() {
    _controller.clear();
    _focusNode.requestFocus(); // Возвращаем фокус после очистки
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: 'Введите имя',
            hintText: 'Иван Иванов',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: _clearInput,
              tooltip: 'Очистить',
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: _showInput,
              child: Text('Показать текст'),
            ),
            SizedBox(width: 12),
            ElevatedButton(
              onPressed: _clearInput,
              child: Text('Очистить'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
