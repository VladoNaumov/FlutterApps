import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Основной класс приложения, наследуется от StatelessWidget (неизменяемый виджет)
class MyApp extends StatelessWidget {
  // Конструктор с ключом для идентификации виджета
  const MyApp({super.key});

  // Метод build определяет структуру пользовательского интерфейса
  @override
  Widget build(BuildContext context) {
    // MaterialApp - корневой виджет приложения, задает основные настройки
    return MaterialApp(
      title: "Flutter Playground", // Заголовок приложения, отображается в системном интерфейсе
      theme: ThemeData(
        useMaterial3: true, // Включаем Material 3 для современного дизайна (поддерживается в Flutter 3.32.0)
        // Задаем цветовую схему, где secondary заменяет устаревший accentColor
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
        // Определяем текстовую тему с кастомным стилем для headlineMedium
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24), // Стиль текста с размером шрифта 24
        ),
      ),
      // Scaffold - базовая структура экрана с поддержкой элементов Material Design
      home: Scaffold(
        // Column - располагает дочерние элементы вертикально
        body: Column(
          children: [
            // Spacer - гибкое пустое пространство, распределяет место между виджетами
            const Spacer(),
            // Center - центрирует дочерний виджет по горизонтали и вертикали
            const Center(
              // Opacity - задает прозрачность дочернего виджета
              child: Opacity(
                opacity: 0.25, // Уровень прозрачности 25%
                child: Text("Faded"), // Текст "Faded"
              ),
            ),
            const Spacer(),
            Center(
              // Theme - локально изменяет тему для дочерних виджетов
              child: Theme(
                // Копируем текущую тему, изменяя только colorScheme.secondary
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.red),
                ),
                // Container - универсальный виджет для стилизации и компоновки
                child: Container(
                  color: Theme.of(context).colorScheme.secondary, // Красный фон
                  child: Text(
                    "Text with a background color", // Текст
                    style: Theme.of(context).textTheme.headlineMedium, // Стиль headlineMedium
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              // DecoratedBox - добавляет декоративный фон (например, градиент)
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  // LinearGradient - создает линейный градиент
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, // Начало градиента (сверху)
                    end: Alignment.bottomCenter, // Конец градиента (снизу)
                    colors: [Color(0xFF000000), Color(0xFFFF0000)], // Черный -> красный
                    tileMode: TileMode.repeated, // Повторение градиента
                  ),
                ),
                // Container внутри DecoratedBox задает фиксированные размеры
                child: Container(
                  width: 100, // Ширина 100 пикселей
                  height: 100, // Высота 100 пикселей
                  child: const Text(
                    "Hello", // Текст "Hello"
                    style: TextStyle(color: Colors.white), // Белый цвет текста
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                color: Colors.yellow, // Желтый фон внешнего контейнера
                // Transform - применяет геометрические трансформации
                child: Transform(
                  alignment: Alignment.bottomLeft, // Точка привязки трансформации
                  // Matrix4 - матрица для наклона и поворота
                  transform: Matrix4.skewY(0.4)..rotateZ(-3 / 12.0), // Наклон по Y и поворот
                  child: Container(
                    padding: const EdgeInsets.all(12.0), // Внутренние отступы 12 пикселей
                    color: Colors.red, // Красный фон внутреннего контейнера
                    child: const Text("Eat at Joe's!"), // Текст
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/*
Этот код создает простое приложение Flutter, отображающее экран с колонкой из пяти секций,
разделенных пустым пространством (Spacer). Каждая секция демонстрирует разные возможности Flutter для работы с виджетами,
стилями и трансформациями:

Методы и виджеты:
MaterialApp:
Корневой виджет, задает настройки приложения (заголовок, тема, начальный экран).

title: отображается в системном интерфейсе (например, в панели задач).

theme: определяет глобальную тему (цвета, шрифты).

home: задает главный экран приложения.

ThemeData:Определяет тему приложения.

useMaterial3: true: включает стили Material 3 (совместимо с Flutter 3.32.0).

colorScheme.secondary: задает вторичный цвет (замена accentColor).

textTheme: определяет стили текста, включая headlineMedium.

Scaffold:Предоставляет структуру экрана (например, body для содержимого).

Column:Располагает дочерние виджеты вертикально.

Spacer:Занимает доступное пространство, равномерно распределяя его между виджетами.

Center:Центрирует дочерний виджет.

Opacity:Управляет прозрачностью (opacity: 0.25 = 25% видимость).

Theme:Локально изменяет тему через Theme.of(context).copyWith.
Используется для задания colorScheme.secondary для конкретного виджета.

Container:Задает стиль (цвет, размеры, отступы) и компоновку.
Используется для фона и контейнеров с текстом.

DecoratedBox:Добавляет декоративный фон, например, градиент через BoxDecoration.

LinearGradient:Создает линейный градиент с указанными цветами и направлениями.

Transform:Применяет геометрические трансформации.

Matrix4.skewY(0.4): наклон по оси Y.

rotateZ(-3 / 12.0): поворот вокруг оси Z.

Text:Отображает текст с настраиваемым стилем (TextStyle).

* */