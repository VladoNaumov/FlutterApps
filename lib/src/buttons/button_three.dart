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
          title: Text('ClipBehavior и ButtonStyle'), // Заголовок приложения
          backgroundColor: Colors.purple, // Цвет AppBar
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
          // 1. ElevatedButton с ButtonStyle и ClipBehavior
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Закругленные углы для обрезки
            clipBehavior: Clip.antiAlias, // Плавная обрезка краёв
            child: Container(
              // Контейнер с градиентом для визуального эффекта
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue], // Градиент
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  print('Нажата ElevatedButton!');
                },
                style: ButtonStyle(
                  // Прозрачный фон, чтобы видеть градиент контейнера
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  // Цвет текста
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  // Отступы внутри кнопки
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  // Форма кнопки (без закругления, так как обрезка уже в ClipRRect)
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Без радиуса внутри кнопки
                    ),
                  ),
                  // Тень кнопки
                  elevation: WidgetStateProperty.all(5),
                ),
                child: Text('ElevatedButton с Clip'),
              ),
            ),
          ),

          // 2. OutlinedButton с ButtonStyle и ClipBehavior
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Закругленные углы
            clipBehavior: Clip.hardEdge, // Жёсткая обрезка (быстрее, но менее плавно)
            child: OutlinedButton(
              onPressed: () {
                print('Нажата OutlinedButton!');
              },
              style: ButtonStyle(
                // Цвет контура
                side: WidgetStateProperty.all(
                  BorderSide(color: Colors.purple, width: 2),
                ),
                // Цвет текста
                foregroundColor: WidgetStateProperty.all(Colors.purple),
                // Отступы
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                // Форма кнопки
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Text('OutlinedButton с Clip'),
            ),
          ),

          // 3. TextButton с ButtonStyle и ClipBehavior
          ClipRect(
            clipBehavior: Clip.antiAlias, // Плавная обрезка для прямоугольника
            child: Container(
              // Контейнер с цветом для демонстрации обрезки
              color: Colors.purple.withOpacity(0.2),
              child: TextButton(
                onPressed: () {
                  print('Нажата TextButton!');
                },
                style: ButtonStyle(
                  // Цвет текста
                  foregroundColor: WidgetStateProperty.all(Colors.purple),
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
                child: Text('TextButton с Clip'),
              ),
            ),
          ),

          // 4. IconButton с ButtonStyle и ClipBehavior
          ClipOval(
            clipBehavior: Clip.antiAlias, // Плавная обрезка для круга
            child: Container(
              color: Colors.purple.withOpacity(0.2), // Фон для демонстрации
              child: IconButton(
                onPressed: () {
                  print('Нажата IconButton!');
                },
                icon: Icon(Icons.star),
                style: ButtonStyle(
                  // Цвет иконки
                  foregroundColor: WidgetStateProperty.all(Colors.yellow),
                ),
                iconSize: 40, // Размер иконки
                tooltip: 'Нажми на звезду',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

Объяснение кода и ClipBehavior:
Что такое ClipBehavior?
  ClipBehavior определяет, как виджет обрезает своё содержимое, если оно выходит за границы.
  Используется с виджетами, такими как ClipRRect, ClipRect, ClipOval, чтобы обрезать содержимое кнопок или других элементов.
Основные значения:
  Clip.none: Без обрезки (содержимое видно за границами).
  Clip.hardEdge: Жёсткая обрезка (быстрая, но может быть резкой).
  Clip.antiAlias: Плавная обрезка с сглаживанием (выглядит лучше, но чуть медленнее).
  Clip.antiAliasWithSaveLayer: Ещё более качественная обрезка, но ресурсоёмкая (редко используется).
ElevatedButton:
  Обёрнута в ClipRRect с clipBehavior: Clip.antiAlias для плавной обрезки углов.
  Контейнер с градиентом добавлен для красивого фона.
  ButtonStyle задаёт прозрачный фон (backgroundColor: Colors.transparent), чтобы градиент был виден, а также белый текст и тень.
  Форма кнопки (shape) задана как BorderRadius.zero, так как обрезка выполняется ClipRRect.
OutlinedButton:
  Обёрнута в ClipRRect с clipBehavior: Clip.hardEdge для жёсткой обрезки (демонстрация другого типа).
  ButtonStyle задаёт пурпурный контур, текст и закругленные углы.
  Обрезка нужна, если кнопка выходит за границы или имеет сложный фон.
TextButton:
  Обёрнута в ClipRect с clipBehavior: Clip.antiAlias для прямоугольной обрезки.
  Контейнер с полупрозрачным фоном показывает, как обрезка ограничивает содержимое.
  ButtonStyle задаёт пурпурный текст и подчеркивание.
IconButton:
  Обёрнута в ClipOval с clipBehavior: Clip.antiAlias для круглой обрезки.
  Контейнер с фоном демонстрирует, как иконка ограничивается кругом.
  ButtonStyle задаёт жёлтый цвет иконки.
Как это выглядит:
ElevatedButton: Кнопка с градиентным фоном (пурпурно-синий), белым текстом, закруглёнными углами и тенью.
OutlinedButton: Кнопка с пурпурным контуром и текстом, обрезанная с закруглениями.
TextButton: Текст с подчеркиванием на полупрозрачном фоне, обрезанный прямоугольником.
IconButton: Жёлтая звезда в круглой обрезке на полупрозрачном фоне.
*/