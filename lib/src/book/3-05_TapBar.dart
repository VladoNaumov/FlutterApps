import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Класс MyApp — главный виджет приложения, наследуется от StatelessWidget (неизменяемый виджет)
class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp — основной виджет для создания приложения с дизайном Material
      home: DefaultTabController(
        // DefaultTabController управляет состоянием вкладок
        length: 3, // Количество вкладок (3)
        child: Scaffold(
          // Scaffold задаёт структуру экрана
          appBar: AppBar(
            title: Text("Flutter Playground"), // Заголовок в верхней панели
            bottom: TabBar(
              // TabBar — панель вкладок, отображаемая внизу AppBar
              tabs: [
                // Вкладка 1 с иконкой объявления
                Tab(icon: Icon(Icons.announcement)),
                // Вкладка 2 с иконкой торта
                Tab(icon: Icon(Icons.cake)),
                // Вкладка 3 с иконкой облака
                Tab(icon: Icon(Icons.cloud)),
              ],
            ),
          ),
          // TabBarView отображает содержимое текущей вкладки
          body: TabBarView(
            children: [
              // Содержимое для вкладки 1
              Center(child: Text("Announcements")),
              // Содержимое для вкладки 2
              Center(child: Text("Birthdays")),
              // Содержимое для вкладки 3
              Center(child: Text("Data")),
            ],
          ),
        ),
      ),
    );
  }
}

/*
тот код создаёт Flutter-приложение с интерфейсом, содержащим три вкладки.
Каждая вкладка имеет иконку в верхней панели (TabBar) и отображает соответствующее содержимое в TabBarView.
Вкладки управляются с помощью DefaultTabController, который синхронизирует выбор вкладки с отображаемым содержимым.

Класс MyApp и StatelessWidget:
MyApp наследуется от StatelessWidget, так как состояние вкладок управляется DefaultTabController, а сам виджет не требует изменения состояния.

Это делает код проще, так как нет необходимости использовать StatefulWidget.

Метод build:
Создаёт интерфейс с помощью MaterialApp и Scaffold.

DefaultTabController задаёт количество вкладок (length: 3) и управляет их переключением.

Виджет AppBar:
Содержит заголовок "Flutter Playground".

Свойство bottom принимает TabBar, который отображает панель вкладок.

Виджет TabBar:
Содержит список из трёх Tab, каждый из которых имеет иконку (Icons.announcement, Icons.cake, Icons.cloud).

TabBar отображается внизу AppBar и позволяет пользователю переключаться между вкладками.

Виджет TabBarView:
Содержит список из трёх виджетов, соответствующих вкладкам.

Каждая вкладка отображает текст в центре экрана: "Announcements", "Birthdays" или "Data".

TabBarView синхронизируется с TabBar через DefaultTabController.

Что делает приложение
Показывает экран с заголовком "Flutter Playground" в верхней панели (AppBar).

Внизу заголовка отображается панель с тремя вкладками, каждая из которых имеет иконку (объявление, торт, облако).

При выборе вкладки в TabBar отображается соответствующее содержимое в TabBarView:
Вкладка 1: Текст "Announcements".
Вкладка 2: Текст "Birthdays".
Вкладка 3: Текст "Data".

Пользователь может переключаться между вкладками, нажимая на иконки.

*/