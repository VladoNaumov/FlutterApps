import 'package:flutter/material.dart';

void main() => runApp(ListViewRun()); // Точка входа. Запускает приложение.

class ListViewRun extends StatelessWidget {
  const ListViewRun({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple, // Цвет AppBar
        ),
      ),
      home: const ListViewOne(), // Главный экран
    );
  }
}

class ListViewOne extends StatelessWidget {
  const ListViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Demo')), // Верхняя панель
      body: ListView.builder(
        itemCount: 20, // ← добавили лимит
        itemBuilder: (BuildContext context, int index) {
          print('$index'); // Вывод индекса в консоль
          return Container(
            color: index % 2 == 0 ? Colors.red : Colors.blue, // Чередование цветов
            padding: EdgeInsets.all(100.0), // Большой отступ вокруг текста
            child: Text('$index'), // Отображаем индекс
          );
        },
      ),
    );
  }
}

/*
Твой код создаёт приложение с использованием **`ListView.builder`** для отображения списка из 20 элементов с чередующимися цветами фона. Вот его резюме:

###  **`ListViewOne` (экран с `ListView`)**

* **Тип**: `StatelessWidget`
* **Метод**: `build(BuildContext context)`

  * **Назначение**: Строит виджет `Scaffold` с `AppBar` и телом (`body`). В теле отображается список с помощью **`ListView.builder`**.
  * **Методы** внутри:

    * **`ListView.builder`**:

      * **`itemCount`** — указывает количество элементов (в данном случае 20).
      * **`itemBuilder`** — строит каждый элемент списка с использованием индекса, чередуя цвета (красный для четных и синий для нечетных индексов).
      * **`EdgeInsets.all(100.0)`** — добавляет отступы вокруг текста (в данном случае это очень большие отступы, создавая "огромные" карточки).

### **Важные моменты:**

1. **`ListView.builder`** используется для создания списка с **динамически загружаемыми** элементами. Он эффективен, потому что создаёт элементы только по мере их видимости.
2. **Отступы** через `padding: EdgeInsets.all(100.0)` создают большие пробелы между элементами, что может быть не совсем удобно для большинства приложений, если не требуется такой размер.

---

### Советы:

* **Оптимизация отступов**: Если не нужно таких больших отступов, можно уменьшить `EdgeInsets.all()` до более разумных значений (например, `EdgeInsets.all(16.0)`).
* **Использование `ListView.builder`** с таким количеством элементов работает очень эффективно, так как он не создаёт элементы списка заранее, а только тогда, когда они становятся видимыми.

 */