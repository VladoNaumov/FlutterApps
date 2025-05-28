// Что мы создадим:
// Форма регистрации с полями: Имя Email Пароль
//
// Будет:
// Проверка, что поля не пустые,  Проверка email-формата,  Скрытие пароля
// Вывод данных в консоль при нажатии кнопки

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Регистрация',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Все поля валидны
      print('Имя: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Пароль: ${passwordController.text}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Форма успешно отправлена!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Форма регистрации')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // подключаем ключ формы
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Имя
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Имя',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Некорректный email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Пароль
              TextFormField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен быть не менее 6 символов';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              // Кнопка отправки
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Зарегистрироваться'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

##

| Функциональность        | Что ты осваиваешь                          |
| ----------------------- | ------------------------------------------ |
| `TextFormField`         | Ввод текста с валидацией                   |
| `TextEditingController` | Управление текстом                         |
| `Form` + `GlobalKey`    | Работа с формами                           |
| `SnackBar`              | Уведомления пользователю                   |
| `setState`              | Управление состоянием (`обскурить` пароль) |
| Валидация               | Проверка ввода пользователя                |


---

## 🟦 1. `TextField` и `TextFormField` — в чём разница?

| Свойство              | `TextField`         | `TextFormField`            |
| --------------------- | ------------------- | -------------------------- |
| Используется с формой | ❌ (нужно вручную)   | ✅ встроено в `Form`        |
| `validator:`          | ❌ нет               | ✅ есть                     |
| Для одиночного поля   | ✅ Да                | ✅ Да, но особенно для форм |
| Удобен в формах       | ❌ Нужно больше кода | ✅ Более удобен             |

> 📌 **ИТОГО**: Если у тебя **форма с валидацией** — используй `TextFormField`.

---

## 🟦 2. Основные параметры `TextFormField` / `TextField`

| Параметр                              | Назначение                                  |
| ------------------------------------- | ------------------------------------------- |
| `controller:`                         | Управление текстом                          |
| `decoration:`                         | Внешний вид поля                            |
| `keyboardType:`                       | Тип клавиатуры (текст, email, число и т.д.) |
| `obscureText:`                        | Скрытие текста (например, пароль)           |
| `onChanged:`                          | Реакция на ввод                             |
| `validator:` (только `TextFormField`) | Проверка правильности ввода                 |
| `autofocus:`                          | Автофокус при открытии                      |
| `enabled:`                            | Включено/выключено поле                     |
| `readOnly:`                           | Только для чтения                           |
| `style:`                              | Стиль текста                                |
| `maxLength:`                          | Максимальная длина текста                   |
| `maxLines:`                           | Многострочное поле                          |

---

*/