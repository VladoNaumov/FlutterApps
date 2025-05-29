/* пример кода `TextField`, в котором используются:

* **настройки клавиатуры** (`keyboardType`, `textInputAction`);
* **настройки курсора** (`cursorColor`, `cursorHeight`, `cursorWidth`);
* **настройка текста** (`style`);
* **ограничение на количество символов** (`maxLength`);
* **многострочный режим** (`minLines`, `maxLines`);
* **счётчик символов** — встроенный.

*/


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Расширенный TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomTextFieldExample(),
      ),
    ),
  ));
}

class CustomTextFieldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // 🔹 Настройка клавиатуры
      keyboardType: TextInputType.text,             // Тип клавиатуры (например: email, number)
      textInputAction: TextInputAction.done,        // Кнопка на клавиатуре (например: done, next)

      // 🔹 Настройка курсора
      cursorColor: Colors.deepPurple,               // Цвет курсора
      cursorHeight: 24,                             // Высота курсора
      cursorWidth: 2,                               // Ширина курсора

      // 🔹 Настройка текста
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),

      // 🔹 Количество строк
      minLines: 2,
      maxLines: 4,                                   // Разрешены от 2 до 4 строк

      // 🔹 Ограничение по символам
      maxLength: 10,                                 // Максимум 10 символов (внизу появится счётчик)

      decoration: InputDecoration(
        labelText: 'Введите сообщение',
        hintText: 'Пример: Привет!',
        border: OutlineInputBorder(),
        counterText: '',                             // Можно скрыть счётчик, если нужно
      ),
    );
  }
}


/*
### 💡 Что делает каждая часть

| Часть                                        | Где в коде             | Описание                                               |
| -------------------------------------------- | ---------------------- | ------------------------------------------------------ |
| `keyboardType`                               | `TextField(...)`       | Настройка типа клавиатуры (текст, число, email и т.д.) |
| `textInputAction`                            | `TextField(...)`       | Действие при нажатии на кнопку (Done, Next и др.)      |
| `cursorColor`, `cursorHeight`, `cursorWidth` | `TextField(...)`       | Визуальные параметры курсора                           |
| `style`                                      | `TextField(...)`       | Настройка шрифта, размера и цвета текста               |
| `minLines`, `maxLines`                       | `TextField(...)`       | Позволяет вводить несколько строк                      |
| `maxLength`                                  | `TextField(...)`       | Ограничение на количество символов и счётчик           |
| `decoration.counterText`                     | `InputDecoration(...)` | Можно убрать счётчик, установив пустую строку          |

---
*/
