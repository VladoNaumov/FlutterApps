// Вот простой пример формы  с использованием TextFormField, Form, GlobalKey,
// пример формы  с двумя полями: имя и email, с валидацией, переключением фокуса

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Форма с двумя полями',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Форма регистрации'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Контроллеры и фокус-ноды
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  // Валидация имени
  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введите имя';
    }
    if (value.trim().length < 3) {
      return 'Имя слишком короткое';
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Имя не должно содержать цифры';
    }
    return null;
  }

  // Валидация email
  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введите email';
    }
    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) {
      return 'Некорректный формат email';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Добро пожаловать, $name!\nВаш email: $email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Ключ для управления формой
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Поле ввода имени
          TextFormField(
            controller: _nameController,
            focusNode: _nameFocus,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Имя',
              hintText: 'Иван',
              border: OutlineInputBorder(),
            ),
            validator: _validateName,
            onFieldSubmitted: (_) {
              // Переход к email при нажатии "далее"
              FocusScope.of(context).requestFocus(_emailFocus);
            },
          ),
          SizedBox(height: 16),

          // Поле ввода email
          TextFormField(
            controller: _emailController,
            focusNode: _emailFocus,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'ivan@example.com',
              border: OutlineInputBorder(),
            ),
            validator: _validateEmail,
            onFieldSubmitted: (_) => _submitForm(),
          ),
          SizedBox(height: 16),

          // Кнопка отправки
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Отправить'),
          ),
        ],
      ),
    );
  }
}

// Пояснение к коду:
// Form и GlobalKey<FormState>	Оборачивает поля в форму и позволяет проверять/сохранять состояние формы.
// TextFormField	Аналог TextField, но с поддержкой встроенной валидации (validator).
// FocusNode	Управляет фокусом вручную (чтобы переходить от поля к полю).
// onFieldSubmitted	Срабатывает при нажатии "Далее" на клавиатуре, позволяет переключать фокус или отправлять форму.
// TextInputAction.next	Меняет кнопку на клавиатуре на "Далее".
// validator	Проверка введённых данных (например, пусто, слишком короткое имя, неправильный email).