import 'package:flutter/material.dart';

class ExamConteinerOne extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo App ',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: false
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Пример цвета'),
          ),
          body: Example()),
    );
  }
}

class Example extends StatelessWidget{
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}

class ExamlContainerTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container Example')),
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
            ),
            child: Text('Container', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

/*
* Container — это многофункциональный виджет-обёртка, который позволяет:

управлять размером
задавать цвет, фон и границы
выравнивать дочерний виджет
добавлять отступы и внешние поля (padding и margin)

| Свойство          | Описание                                                |
| ----------------- | ------------------------------------------------------- |
| `width`, `height` | Ширина и высота                                         |
| `color`           | Фон                                                     |
| `padding`         | Внутренние отступы (между границей и контентом)         |
| `margin`          | Внешние отступы (вокруг контейнера)                     |
| `alignment`       | Выравнивание дочернего виджета                          |
| `decoration`      | Более сложное оформление: цвета, границы, тени, радиусы |
| `child`           | Вложенный (внутренний) виджет                           |


*/