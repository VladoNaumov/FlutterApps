
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

// Класс MyApp — главный виджет приложения, наследуется от StatefulWidget (виджет с изменяемым состоянием)
class MyApp extends StatefulWidget {
  @override
  // Создаём состояние для MyApp
  _MyAppState createState() => _MyAppState();
}

// Класс LoginData для хранения данных формы (имя пользователя и пароль)
class LoginData {
  String username = ""; // Переменная для хранения имени пользователя
  String password = ""; // Переменная для хранения пароля
}

// Класс _MyAppState управляет состоянием виджета MyApp
class _MyAppState extends State<MyApp> {
  // Экземпляр LoginData для хранения введённых данных
  final LoginData _loginData = LoginData();
  // GlobalKey для управления формой (например, для валидации и сохранения)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  // Метод build определяет, как будет выглядеть экран
  Widget build(BuildContext inContext) {
    // MaterialApp — основной виджет для создания приложения с дизайном Material
    return MaterialApp(
      home: Scaffold(
        // Scaffold задаёт структуру экрана
        body: Container(
          padding: EdgeInsets.all(50.0), // Отступы со всех сторон на 50 пикселей
          child: Form(
            key: _formKey, // Привязываем ключ формы для управления
            child: Column(
              // Column располагает виджеты вертикально
              children: [
                // Поле ввода для имени пользователя (e-mail)
                TextFormField(
                  keyboardType: TextInputType.emailAddress, // Клавиатура для ввода email
                  validator: (String? inValue) {
                    // Проверка: если поле пустое, возвращаем сообщение об ошибке
                    if (inValue == null || inValue.isEmpty) {
                      return "Please enter username";
                    }
                    return null; // Если всё в порядке, возвращаем null
                  },
                  onSaved: (String? inValue) {
                    // Сохраняем введённое значение в _loginData.username
                    _loginData.username = inValue ?? "";
                  },
                  decoration: InputDecoration(
                    hintText: "none@none.com", // Подсказка в поле ввода
                    labelText: "Username (eMail address)", // Метка поля
                  ),
                ),
                // Поле ввода для пароля
                TextFormField(
                  obscureText: true, // Скрывает введённый текст (для пароля)
                  validator: (String? inValue) {
                    // Проверка: пароль должен быть длиннее 10 символов
                    if (inValue == null || inValue.length < 10) {
                      return "Password must be >=10 in length";
                    }
                    return null; // Если всё в порядке, возвращаем null
                  },
                  onSaved: (String? inValue) {
                    // Сохраняем введённое значение в _loginData.password
                    _loginData.password = inValue ?? "";
                  },
                  decoration: InputDecoration(
                    hintText: "Password", // Подсказка в поле ввода
                    labelText: "Password", // Метка поля
                  ),
                ),
                // Пустое пространство высотой 20 пикселей для визуального разделения
                SizedBox(height: 20),
                // Кнопка для отправки формы
                ElevatedButton(
                  child: Text("Log In!"), // Текст на кнопке
                  onPressed: () {
                    // Проверяем, прошла ли валидация формы
                    if (_formKey.currentState?.validate() ?? false) {
                      // Сохраняем данные формы
                      _formKey.currentState?.save();
                      // Выводим введённые данные в консоль
                      print("Username: ${_loginData.username}");
                      print("Password: ${_loginData.password}");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Общее объяснение кода
Этот код создаёт Flutter-приложение с экраном, содержащим простую форму для ввода имени пользователя (e-mail) и пароля. Форма включает валидацию и кнопку для отправки данных. После успешной валидации данные сохраняются в объект LoginData и выводятся в консоль.
Разбор ключевых компонентов
Точка входа (main):
Функция main запускает приложение, вызывая runApp с виджетом MyApp.

Класс MyApp и StatefulWidget:
MyApp наследуется от StatefulWidget, так как форма должна реагировать на изменения (например, валидацию и сохранение данных).

Состояние управляется в классе _MyAppState.

Класс LoginData:
Простой класс для хранения данных формы: username (e-mail) и password.

Используется для сохранения введённых пользователем данных после валидации.

Переменные состояния:
_loginData: Экземпляр LoginData для хранения имени пользователя и пароля.

_formKey: GlobalKey<FormState> для управления формой (валидация и сохранение).

Метод build:
Создаёт интерфейс с помощью MaterialApp и Scaffold.

Container с отступами (padding: EdgeInsets.all(50.0)) содержит форму.

Form оборачивает поля ввода и кнопку, используя _formKey для управления.

Column располагает элементы вертикально.

Поля ввода (TextFormField):
Поле для имени пользователя:
keyboardType: TextInputType.emailAddress задаёт клавиатуру, оптимизированную для ввода e-mail.

validator: Проверяет, что поле не пустое. Если пустое, возвращает сообщение об ошибке.

onSaved: Сохраняет введённое значение в _loginData.username.

decoration: Добавляет метку и подсказку для поля.

Поле для пароля:
obscureText: true скрывает введённый текст (для безопасности пароля).

validator: Проверяет, что длина пароля ≥ 10 символов.

onSaved: Сохраняет введённое значение в _loginData.password.

decoration: Добавляет метку и подсказку.

Кнопка (ElevatedButton):
При нажатии вызывает _formKey.currentState?.validate() для проверки формы.

Если валидация успешна, вызывает _formKey.currentState?.save() для сохранения данных.

Выводит введённые username и password в консоль.

Что делает приложение
Показывает экран с формой, содержащей два поля ввода: для e-mail и пароля.

Проверяет:
Поле e-mail не должно быть пустым.

Пароль должен содержать не менее 10 символов.

Если валидация пройдена, при нажатии на кнопку "Log In!" данные сохраняются в объект LoginData и выводятся в консоль.


* */