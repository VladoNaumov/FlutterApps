import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Класс MyApp — главный виджет приложения, наследуется от StatelessWidget (неизменяемый виджет)
class MyApp extends StatelessWidget {
  @override
  // Метод build определяет, как будет выглядеть приложение
  Widget build(BuildContext context) {
    // MaterialApp — основной виджет для создания приложения с дизайном Material
    // home: Scaffold — задаёт основную структуру экрана
    return MaterialApp(
        home: Scaffold(
            body: Home())
    );
  }
}

// Класс Home — виджет, который отображает содержимое экрана
class Home extends StatelessWidget {
  // Асинхронная функция _selectDate показывает диалог выбора даты
  Future<void> _selectDate(BuildContext context) async {
    // showDatePicker — функция, открывающая диалоговое окно для выбора даты
    // Возвращает Future<DateTime?>, то есть выбранную дату или null, если выбор не сделан
    DateTime? selectedDate = await showDatePicker(
      context: context, // Контекст для отображения диалога
      initialDate: DateTime.now(), // Начальная дата — текущая
      firstDate: DateTime(2017), // Самая ранняя дата, доступная для выбора
      lastDate: DateTime(2025), // Самая поздняя дата, доступная для выбора
    );

    // Проверяем, была ли выбрана дата (selectedDate не null)
    if (selectedDate != null) {
      // Выводим выбранную дату в консоль
      print("Selected date: $selectedDate");
    }
  }

  // Асинхронная функция _selectTime показывает диалог выбора времени
  Future<void> _selectTime(BuildContext context) async {
    // showTimePicker — функция, открывающая диалоговое окно для выбора времени
    // Возвращает Future<TimeOfDay?>, то есть выбранное время или null, если выбор не сделан
    TimeOfDay? selectedTime = await showTimePicker(
      context: context, // Контекст для отображения диалога
      initialTime: TimeOfDay.now(), // Начальное время — текущее
    );

    // Проверяем, было ли выбрано время (selectedTime не null)
    if (selectedTime != null) {
      // Выводим выбранное время в консоль
      print("Selected time: $selectedTime");
    }
  }

  @override
  // Метод build определяет, как будет выглядеть экран
  Widget build(BuildContext context) {
    // Scaffold — структура экрана
    return Scaffold(
      body: SafeArea(
        // SafeArea предотвращает наложение содержимого на системные области (например, статус-бар)
        child: Column(
          // Column располагает виджеты вертикально
          children: [
            // SizedBox создаёт пустое пространство высотой 50 пикселей
            SizedBox(height: 50),
            // Кнопка для вызова диалога выбора даты
            ElevatedButton(
              child: Text("Test DatePicker"), // Текст на кнопке
              onPressed: () => _selectDate(context), // При нажатии вызывается _selectDate
            ),
            // Кнопка для вызова диалога выбора времени
            ElevatedButton(
              child: Text("Test TimePicker"), // Текст на кнопке
              onPressed: () => _selectTime(context), // При нажатии вызывается _selectTime
            ),
          ],
        ),
      ),
    );
  }
}

/*
Общее объяснение кода
Этот код создаёт простое Flutter-приложение, которое отображает экран с двумя кнопками:
"Test DatePicker" — открывает диалоговое окно для выбора даты.

"Test TimePicker" — открывает диалоговое окно для выбора времени.

После выбора даты или времени результат выводится в консоль. Давайте разберём, как это работает:
Точка входа (main):
Функция main запускает приложение, вызывая runApp с виджетом MyApp. Это стандартная точка входа для Flutter-приложений.

Класс MyApp:
Это корневой виджет приложения, использующий MaterialApp для создания интерфейса в стиле Material Design.

Внутри MaterialApp задаётся Scaffold, который определяет структуру экрана и содержит виджет Home.

Класс Home:
Это основной экран приложения, содержащий:
SafeArea: Этот виджет предотвращает наложение содержимого на системные области устройства, такие как статус-бар или вырез (notch).

Column: Располагает виджеты (кнопки) вертикально.

SizedBox: Создаёт отступ сверху высотой 50 пикселей для визуального разделения.

Две кнопки (ElevatedButton):
Первая вызывает _selectDate для выбора даты.

Вторая вызывает _selectTime для выбора времени.

Функция _selectDate:
Эта асинхронная функция использует showDatePicker, чтобы открыть диалоговое окно выбора даты.

Параметры showDatePicker:
context: Требуется для отображения диалога.

initialDate: Устанавливает текущую дату как начальную.

firstDate и lastDate: Ограничивают диапазон дат (с 2017 по 2025 год).

Если пользователь выбирает дату, она сохраняется в selectedDate (тип DateTime?).

Если selectedDate не null, выбранная дата выводится в консоль (например, Selected date: 2025-05-20 00:00:00.000).

Функция _selectTime:
Эта асинхронная функция использует showTimePicker, чтобы открыть диалоговое окно выбора времени.

Параметры showTimePicker:
context: Требуется для отображения диалога.

initialTime: Устанавливает текущее время как начальное.

Если пользователь выбирает время, оно сохраняется в selectedTime (тип TimeOfDay?).

Если selectedTime не null, выбранное время выводится в консоль (например, Selected time: 7:02 PM).

Что делает приложение:
Показывает экран с двумя кнопками: "Test DatePicker" и "Test TimePicker".
При нажатии на "Test DatePicker" открывается календарь, где можно выбрать дату в диапазоне с 2017 по 2025 год.
При нажатии на "Test TimePicker" открывается диалог для выбора времени.
После выбора даты или времени результат выводится в консоль.


* */
