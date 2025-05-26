Построение UI во Flutter начинается с **виджета `runApp()`**, 
в который передаётся **корневой виджет** приложения. Обычно это:

1. `MaterialApp` — если используется Material Design (Android-подобный стиль).
2. `CupertinoApp` — для iOS-стиля.
3. Ваш кастомный виджет, например `MyApp`.

Пример:

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // базовая структура экрана
        appBar: AppBar(title: Text('Пример')), // Верхняя панель.
        body: Center(child: Text('Привет, Flutter!')),
      ),
    );
  }
}
```

То есть, всё начинается с `runApp()`, а дальше вы строите дерево виджетов: `MaterialApp` → `Scaffold` → и так далее.

Вот **основные виджеты**, с которых чаще всего начинается дерево виджетов во Flutter:

### 1. `MaterialApp`

Главный контейнер для всего приложения. Обеспечивает навигацию, темы и прочее.

```dart
MaterialApp(
  home: MyHomePage(),
)
```

### 2. `Scaffold`

Scaffold нужен для отображения базовой структуры экрана (`AppBar`, `body`, `Drawer`, `BottomNavigationBar`)

```dart
Scaffold(
  appBar: AppBar(title: Text('Заголовок')),
  body: Center(child: Text('Текст')),
)
```

### 3. `AppBar`

Верхняя панель навигации.

```dart
AppBar(title: Text('Мой экран'))
```

### 4. `Center`

Выравнивает дочерний виджет по центру.

```dart
Center(child: Text('Привет'))
```

### 5. `Text`

Отображение текста.

```dart
Text('Пример текста')
```

### 6. `Column` / `Row`

Для вертикального или горизонтального расположения виджетов.

```dart
Column(
  children: [
    Text('Строка 1'),
    Text('Строка 2'),
  ],
)
```

---

**Простой пример дерева:**

```dart
MaterialApp
 └── Scaffold
      ├── AppBar
      └── Body (например, Center)
           └── Text
```

Это базовая структура, с которой обычно начинают.


Кроме `Scaffold`, во Flutter есть множество других **контейнерных и структурных виджетов**, которые можно использовать вместо или вместе с `Scaffold`, в зависимости от целей. Вот основные:

---

### **1. `Container`**

Для оформления: отступы, фон, размеры, выравнивание.

```dart
Container(
  padding: EdgeInsets.all(16),
  color: Colors.blue,
  child: Text('Контейнер'),
)
```

---

### **2. `Center`**

Центрирует дочерний виджет по экрану.

```dart
Center(child: Text('По центру'))
```

---

### **3. `Column` / `Row`**

Располагают дочерние виджеты по вертикали / горизонтали.

```dart
Column(
  children: [Text('1'), Text('2')],
)
```

---

### **4. `Stack`**

Наложение виджетов друг на друга.

```dart
Stack(
  children: [
    Container(color: Colors.red, width: 100, height: 100),
    Positioned(top: 10, left: 10, child: Text('Поверх')),
  ],
)
```

---

### **5. `SafeArea`**

Учитывает вырезы экрана (напр., сверху на iPhone).

```dart
SafeArea(child: Text('Безопасная зона'))
```

---

### **6. `CustomScrollView`, `ListView`, `GridView`**

Для прокрутки и списков:

```dart
ListView(
  children: [Text('Элемент 1'), Text('Элемент 2')],
)
```

---

### **7. `PageView`**

Горизонтальное листание страниц.

```dart
PageView(
  children: [Text('Страница 1'), Text('Страница 2')],
)
```

---

### **8. `CupertinoPageScaffold`**

Аналог `Scaffold` для iOS-стиля интерфейса.

```dart
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(middle: Text('Заголовок')),
  child: Center(child: Text('iOS стиль')),
)
```

---

### Когда можно не использовать `Scaffold`?

* Когда создаёте кастомный экран без стандартных элементов (`AppBar`, `Drawer` и т.п.).
* Когда работаете с `CustomPaint`, `Stack` или `PageView`.

`Scaffold` удобен, но **не обязателен** — это просто шаблон для быстрого создания экрана.

