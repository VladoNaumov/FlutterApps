import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Класс MyApp — главный виджет приложения, наследуется от StatelessWidget (неизменяемый виджет)
class MyApp extends StatelessWidget {
  @override
  // Метод build определяет, как будет выглядеть приложение
  Widget build(BuildContext context) {
    // MaterialApp — основной виджет для создания приложения с дизайном Material
    // home: Scaffold — задаёт основную структуру экрана
    return MaterialApp(home: Scaffold(body: Home()));
  }
}

// Класс Home — виджет, который отображает содержимое экрана
class Home extends StatelessWidget {
  // Асинхронная функция _showIt показывает диалоговое окно с выбором еды
  Future<void> _showIt(BuildContext inContext) async {
    // showDialog — функция, которая открывает диалоговое окно
    // Возвращает Future<String?>, то есть результат выбора пользователя (или null, если ничего не выбрано)
    final String? selectedFood = await showDialog<String>(
      context: inContext, // Контекст для отображения диалога
      builder: (BuildContext inContext) {
        // SimpleDialog — виджет для создания простого диалогового окна
        return SimpleDialog(
          title: Text("What's your favorite food?"), // Заголовок диалога
          children: [
            // SimpleDialogOption — опция в диалоге, которую можно выбрать
            SimpleDialogOption(
              onPressed: () {
                // Navigator.pop закрывает диалог и возвращает "brocolli" как результат
                Navigator.pop(inContext, "brocolli");
              },
              child: Text("Brocolli"), // Текст для отображения опции
            ),
            SimpleDialogOption(
              onPressed: () {
                // Navigator.pop закрывает диалог и возвращает "steak" как результат
                Navigator.pop(inContext, "steak");
              },
              child: Text("Steak"), // Текст для отображения опции
            ),
          ],
        );
      },
    );

    // Проверяем, был ли сделан выбор (selectedFood не null)
    if (selectedFood != null) {
      // Используем switch для обработки выбранной опции
      switch (selectedFood) {
        case "brocolli":
          print("Brocolli"); // Выводим в консоль "Brocolli"
          break;
        case "steak":
          print("Steak"); // Выводим в консоль "Steak"
          break;
        default:
          print("No food selected"); // Если что-то пошло не так
      }
    }
  }

  @override
  // Метод build определяет, как будет выглядеть экран
  Widget build(BuildContext inContext) {
    // Scaffold — структура экрана
    return Scaffold(
      body: Center(
        // Center выравнивает содержимое по центру экрана
        child: ElevatedButton(
          child: Text("Show it"), // Текст на кнопке
          onPressed: () => _showIt(inContext), // При нажатии вызывается функция _showIt
        ),
      ),
    );
  }
}

/*
* Этот код создаёт простое приложение на Flutter, которое показывает экран с кнопкой. При нажатии на кнопку открывается диалоговое окно, где пользователь может выбрать любимую еду ("Brocolli" или "Steak"). После выбора результат выводится в консоль. Давайте разберём, как это работает:
Точка входа (main):
Функция main запускает приложение, вызывая runApp с виджетом MyApp. Это стандартный способ начать Flutter-приложение.

Класс MyApp:
Это корневой виджет приложения. Он использует MaterialApp, который задаёт общий стиль приложения (в стиле Material Design).

Внутри MaterialApp указан Scaffold, который определяет структуру экрана (в данном случае, просто содержит виджет Home).

Класс Home:
Это основной экран приложения. Он содержит:
Кнопку (ElevatedButton) с текстом "Show it", которая находится в центре экрана (благодаря виджету Center).

При нажатии на кнопку вызывается функция _showIt.

Функция _showIt:
Эта функция асинхронная, так как использует showDialog, который возвращает результат в будущем (Future).

showDialog открывает диалоговое окно (SimpleDialog) с заголовком "What's your favorite food?" и двумя опциями: "Brocolli" и "Steak".

Когда пользователь выбирает одну из опций, Navigator.pop закрывает диалог и возвращает выбранное значение ("brocolli" или "steak").

После закрытия диалога результат (selectedFood) проверяется, и в зависимости от выбора в консоль выводится соответствующее сообщение (print).

Логика обработки выбора:
Если пользователь выбрал "Brocolli", в консоль выведется "Brocolli".

Если выбрал "Steak", выведется "Steak".

Если ничего не выбрано (например, диалог закрыт без выбора), ничего не произойдёт, так как selectedFood будет null.

Что делает приложение
Показывает экран с кнопкой "Show it".

При нажатии на кнопку появляется диалоговое окно с вопросом о любимой еде и двумя вариантами ответа.

После выбора одного из вариантов (или закрытия диалога) в консоль выводится результат выбора.

*/