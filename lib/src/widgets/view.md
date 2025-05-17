### 1. **ListView** - прокручиваемый список
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Example')),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
              leading: Icon(Icons.star),
              onTap: () => print('Tapped item $index'),
            );
          },
        ),
      ),
    );
  }
}
```
**Пояснение**:
- `ListView.builder` создаёт прокручиваемый список, рендеря элементы по мере необходимости.
- `itemCount` задаёт количество элементов, `itemBuilder` — как они выглядят.
- `ListTile` — удобный виджет для строк списка.

---

### 2. **GridView** - сетка
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Example')),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          children: List.generate(6, (index) {
            return Container(
              color: Colors.purple[100 * (index % 9 + 1)],
              child: Center(child: Text('Item $index')),
            );
          }),
        ),
      ),
    );
  }
}
```
**Пояснение**:
- `GridView.count` создаёт сетку с фиксированным количеством столбцов (`crossAxisCount`).
- `crossAxisSpacing` и `mainAxisSpacing` задают расстояние между элементами.
- `List.generate` создаёт список элементов.

---