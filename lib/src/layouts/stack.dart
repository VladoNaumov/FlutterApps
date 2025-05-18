import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack Example')),
        body: Center(
          child: Stack(

            children: [
              Container(width: 200, height: 200, color: Colors.blue),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.star, color: Colors.yellow),
              ),
            ],

            /*
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.blue),
              Positioned(
                top: 10,
                left: 10,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Text('Overlay', style: TextStyle(color: Colors.white)),
              ),
            ],
          */
          ),
        ),
      ),
    );
  }
}

/*
* Stack — это контейнер, который накладывает виджеты друг на друга. То есть, размещает детей по слоям, как стопку.

Когда использовать Stack?
Чтобы разместить текст поверх изображения.

Для создания флоатинг-элементов (например, кнопки в углу).

Для сложных UI, где элементы частично перекрываются.
* */