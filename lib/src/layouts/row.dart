import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Row Example')),
        body: Center(
          child: Row(

          children: [
          Icon(Icons.star, color: Colors.orange),
          SizedBox(width: 8), // отступ между элементами
          Text('Оценка: 5.0'),
          ],

            /*
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 80, height: 80, color: Colors.red),
              Container(width: 80, height: 80, color: Colors.green),
              Container(width: 80, height: 80, color: Colors.blue),
            ],
            */
          ),
        ),
      ),
    );
  }
}

/*
 Row — это виджет, который располагает дочерние элементы по горизонтали (в строку), слева направо.

Когда использовать Row?
Для горизонтального размещения: текста + иконки, кнопок в ряд, изображений рядом.
Для создания шапок, меню, заголовков с действиями.

*/