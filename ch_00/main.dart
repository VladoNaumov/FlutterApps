import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



/*
*
### 🔹 `MyApp`

**Тип:** `StatelessWidget`
**Отвечает за:**

* Запуск приложения.
* Настройку глобальной темы (`ThemeData`).
* Назначение главной страницы (`home`).

---

### 🔹 `MyHomePage`

**Тип:** `StatefulWidget`
**Отвечает за:**

* Представление главной страницы.
* Хранит переданный заголовок (`title`).
* Создаёт состояние страницы через `_MyHomePageState`.

---

### 🔹 `_MyHomePageState`

**Тип:** `State<MyHomePage>`
**Отвечает за:**

* Хранение состояния (счётчика `_counter`).
* Обновление UI при изменении состояния (`setState`).
* Реализацию интерфейса: `AppBar`, `Text`, кнопка, логика нажатия.

---

* */