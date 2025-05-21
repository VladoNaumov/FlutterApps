import 'package:flutter/material.dart';

void main() => runApp(const ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список покупок',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShoppingListScreen(),
    );
  }
}

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  final List<String> shoppingItems = const [
    'Молоко',
    'Хлеб',
    'Яйца',
    'Яблоки',
    'Сыр',
    'Макароны',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список покупок'),
      ),
      body: ListView.separated(
        itemCount: shoppingItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              shoppingItems[index],
              style: const TextStyle(fontSize: 18),
            ),
            trailing: const Icon(Icons.check_box_outline_blank),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Выбрано: ${shoppingItems[index]}')),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          );
        },
      ),
    );
  }
}

/*
Список покупок:
Список shoppingItems содержит элементы, которые отображаются в ListView.separated.
Каждый элемент — это ListTile с названием продукта и иконкой чекбокса (для имитации возможности отмечать купленные товары).

Разделители:
separatorBuilder добавляет серую линию (Divider) между элементами списка. Это делает список более читаемым, так как каждый продукт визуально отделён от следующего.
Параметры thickness: 1 и height: 1 делают линию тонкой и компактной.

Интерактивность:
При нажатии на элемент списка показывается SnackBar с сообщением о выбранном продукте.
Почему ListView.separated полезен в этом примере?
Читаемость: Без разделителей элементы списка могут выглядеть как сплошной текст, особенно если их много. Тонкие линии между продуктами помогают пользователю быстрее ориентироваться.
Эстетика: Разделители придают приложению профессиональный вид, как в реальных приложениях для покупок (например, Google Keep или Todoist).
Гибкость: Если вместо линии вы хотите добавить, например, цветной отступ или иконку, separatorBuilder позволяет это сделать. Например:

dart
separatorBuilder: (BuildContext context, int index) {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 4.0),
    child: Icon(Icons.star, color: Colors.yellow, size: 16),
  );
}

Это добавит звёздочку между элементами вместо линии.
*/