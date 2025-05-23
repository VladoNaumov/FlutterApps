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
          title: Text('StatefulWidget и Кнопки'), // Заголовок приложения
          backgroundColor: Colors.orange, // Цвет верхней панели
        ),
        body: ButtonExamples(),
      ),
    );
  }
}

// StatefulWidget для управления состоянием (изменением текста)
class ButtonExamples extends StatefulWidget {
  @override
  _ButtonExamplesState createState() => _ButtonExamplesState();
}

class _ButtonExamplesState extends State<ButtonExamples> {
  // Переменная для хранения текста надписи
  String _labelText = 'Нажми любую кнопку!';

  // Метод для обновления текста при нажатии кнопки
  void _updateLabel(String newText) {
    setState(() {
      // setState обновляет интерфейс, изменяя состояние
      _labelText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Отступы по краям экрана
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Равномерное расположение
        children: [
          // Текст, который будет меняться
          Text(
            _labelText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20), // Отступ между текстом и кнопками

          // 1. ElevatedButton с ButtonStyle
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Закругленные углы
            clipBehavior: Clip.antiAlias, // Плавная обрезка
            child: ElevatedButton(
              onPressed: () {
                // При нажатии обновляем текст
                _updateLabel('Нажата ElevatedButton!');
              },
              style: ButtonStyle(
                // Цвет фона
                backgroundColor: WidgetStateProperty.all(Colors.orange),
                // Цвет текста
                foregroundColor: WidgetStateProperty.all(Colors.white),
                // Отступы
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                // Форма кнопки
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Тень
                elevation: WidgetStateProperty.all(5),
              ),
              child: Text('ElevatedButton'),
            ),
          ),

          // 2. OutlinedButton с ButtonStyle
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Закругленные углы
            clipBehavior: Clip.antiAlias, // Плавная обрезка
            child: OutlinedButton(
              onPressed: () {
                // При нажатии обновляем текст
                _updateLabel('Нажата OutlinedButton!');
              },
              style: ButtonStyle(
                // Цвет контура
                side: WidgetStateProperty.all(
                  BorderSide(color: Colors.orange, width: 2),
                ),
                // Цвет текста
                foregroundColor: WidgetStateProperty.all(Colors.orange),
                // Отступы
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                // Форма кнопки
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text('OutlinedButton'),
            ),
          ),

          // 3. TextButton с ButtonStyle
          TextButton(
            onPressed: () {
              // При нажатии обновляем текст
              _updateLabel('Нажата TextButton!');
            },
            style: ButtonStyle(
              // Цвет текста
              foregroundColor: WidgetStateProperty.all(Colors.orange),
              // Отступы
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              // Стиль текста с подчеркиванием
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            child: Text('TextButton'),
          ),

          // 4. IconButton с ButtonStyle
          ClipOval(
            clipBehavior: Clip.antiAlias, // Круглая обрезка
            child: IconButton(
              onPressed: () {
                // При нажатии обновляем текст
                _updateLabel('Нажата IconButton!');
              },
              icon: Icon(Icons.favorite),
              style: ButtonStyle(
                // Цвет иконки
                foregroundColor: WidgetStateProperty.all(Colors.red),
              ),
              iconSize: 40, // Размер иконки
              tooltip: 'Нажми на сердце',
            ),
          ),
        ],
      ),
    );
  }
}

/*
Объяснение кода:
StatefulWidget:
  StatefulWidget используется, когда интерфейс должен меняться (например, текст надписи в зависимости от нажатия кнопки).
  В отличие от StatelessWidget, StatefulWidget имеет состояние (State), которое можно обновлять с помощью setState.
  В примере класс ButtonExamples — это StatefulWidget, а _ButtonExamplesState — его состояние.
Управление состоянием:
  Переменная _labelText хранит текст, который отображается в Text.
  Метод _updateLabel вызывается при нажатии любой кнопки и использует setState для обновления _labelText.
  setState сообщает Flutter, что нужно перерисовать интерфейс с новым значением текста.
Кнопки и их стили:
ElevatedButton:
  Использует ButtonStyle для задания оранжевого фона, белого текста, тени и закругленных углов.
  Обёрнута в ClipRRect с Clip.antiAlias для плавной обрезки углов.
  При нажатии меняет текст на "Нажата ElevatedButton!".
OutlinedButton:
  ButtonStyle задаёт оранжевый контур, текст и закругленные углы.
  Обёрнута в ClipRRect для обрезки.
  Меняет текст на "Нажата OutlinedButton!".
TextButton:
  ButtonStyle задаёт оранжевый текст с подчеркиванием.
  Без обрезки, так как это текстовая кнопка.
  Меняет текст на "Нажата TextButton!".
IconButton:
  Обёрнута в ClipOval для круглой обрезки.
  ButtonStyle задаёт красный цвет иконки (сердце).
  Меняет текст на "Нажата IconButton!".
Надпись:
  Виджет Text отображает значение _labelText.
  Стиль текста: оранжевый цвет, размер 20, жирный шрифт.
  Обновляется при каждом нажатии кнопки через setState.
Как это выглядит:
  Вверху экрана отображается текст "Нажми любую кнопку!" (изначально).
  Четыре кнопки ниже: оранжевая ElevatedButton, оранжевая OutlinedButton, текстовая TextButton с подчеркиванием и круглая IconButton с красным сердцем.
  При нажатии на любую кнопку текст вверху меняется, указывая, какая кнопка была нажата.
*/