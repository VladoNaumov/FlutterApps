import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView пример'),
        ),
        body: MyListView_(), // тело экрана со списком
      ),
    );
  }
}

class MyListView_ extends StatelessWidget {
  const MyListView_({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16), // отступы по краям списка
      itemCount: 20, // кол-во элементов в списке
      itemBuilder: (context, index) {
        // каждый элемент — это карточка с цветом и текстом
        return Padding(
          padding: const EdgeInsets.only(bottom: 16), // отступ между элементами
          child: Container(
            height: 100, // фиксированная высота
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length], // разные цвета
              borderRadius: BorderRadius.circular(20), // закруглённые углы
            ),
            child: Center(
              child: Text(
                'Элемент ${index + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*

ListView.builder — для большого списка.
padding — внешние отступы у всего списка.
Padding внутри itemBuilder — отступы между элементами.
Container с BoxDecoration — оформление каждого блока.
Colors.primaries[index % ...] — разные цвета автоматически.

* */