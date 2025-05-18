import 'package:flutter/material.dart';

class MyColummOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column Example')),
        body: Center(
          child: Column(
            children: [
              Text('Привет!'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Нажми меня'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyColummTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Пример Column'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // выравнивание по левому краю
            children: [
              const Text(
                'Заголовок',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Это описание под заголовком. Оно может быть длинным.',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Кнопка действия'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

class MyColummThre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Column — это вертикальный контейнер, который размещает дочерние виджеты один под другим сверху вниз.

Где используется Column?
Чтобы разместить текст, кнопку и картинку вертикально.

Для создания форм (input + кнопка).

Внутри Scaffold.body, если ты хочешь собрать интерфейс из разных частей по вертикали.

*/