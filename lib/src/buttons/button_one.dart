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
          title: Text('Примеры кнопок'), // Заголовок приложения
        ),
        body: ButtonExamples(), // Основной контент с примерами кнопок
      ),
    );
  }
}

class ButtonExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Равномерное распределение кнопок по вертикали
        children: [
          // 1. ElevatedButton - Кнопка с заливкой и тенью (выглядит "приподнятой")
          ElevatedButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата ElevatedButton!');
            },
            child: Text('ElevatedButton'), // Текст на кнопке
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Отступы внутри кнопки
              textStyle: TextStyle(fontSize: 16), // Размер текста
            ),
          ),

          // 2. OutlinedButton - Кнопка с контуром, без заливки
          OutlinedButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата OutlinedButton!');
            },
            child: Text('OutlinedButton'), // Текст на кнопке
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue, width: 2), // Цвет и толщина контура
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Отступы
              textStyle: TextStyle(fontSize: 16), // Размер текста
            ),
          ),

          // 3. TextButton - Простая текстовая кнопка без фона и контура
          TextButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата TextButton!');
            },
            child: Text('TextButton'), // Текст на кнопке
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue, // Цвет текста
              textStyle: TextStyle(fontSize: 16), // Размер текста
            ),
          ),

          // 4. IconButton - Кнопка с иконкой
          IconButton(
            onPressed: () {
              // Действие при нажатии кнопки
              print('Нажата IconButton!');
            },
            icon: Icon(Icons.favorite), // Иконка (в данном случае сердце)
            iconSize: 40, // Размер иконки
            color: Colors.red, // Цвет иконки
            tooltip: 'Нажми на сердце', // Подсказка при наведении
          ),
        ],
      ),
    );
  }
}

/*

Объяснение кода:
ElevatedButton:
  Это кнопка с заливкой фона и небольшим эффектом тени, чтобы она выглядела "приподнятой".
  Используется, когда нужно привлечь внимание пользователя к основному действию.
  В примере я настроил отступы (padding) и размер текста через styleFrom.
  При нажатии выводится сообщение в консоль.
OutlinedButton:
  Это кнопка с контуром, но без заливки фона.
  Подходит для второстепенных действий, например, "Отмена".
  Я настроил цвет и толщину контура через side: BorderSide и добавил отступы.
  При нажатии также выводится сообщение в консоль.
TextButton:
  Простая текстовая кнопка без фона и контура, выглядит как обычная ссылка.
  Используется для менее важных действий или в компактных интерфейсах.
  Я задал цвет текста (foregroundColor) и размер шрифта.
  При нажатии выводится сообщение в консоль.
IconButton:
  Кнопка, которая отображает только иконку, без текста.
  Часто используется в панелях навигации или для компактных действий (например, лайк, поделиться).
  Я использовал иконку сердца (Icons.favorite), настроил её размер и цвет, а также добавил подсказку (tooltip).

Как это выглядит:
ElevatedButton: Кнопка с синим фоном (по умолчанию) и текстом "ElevatedButton".
OutlinedButton: Кнопка с синим контуром и текстом "OutlinedButton".
TextButton: Просто текст "TextButton", который выглядит как ссылка.
IconButton: Иконка сердца красного цвета.
 */