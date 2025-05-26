// TODO  "easy version UI interface Login and Password"

import 'package:flutter/material.dart';

// Экран логина
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: LoginContent(),
      ),
    );
  }
}

// Контент логина
class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 25),
        LoginForm(),
        SizedBox(height: 25),
        InfoSection(),
      ],
    );
  }
}

// Форма входа
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final login = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (login == 'admin' && password == 'admin') {
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  void resetPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reset password requested')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: usernameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: login,
          child: const Text('Login'),
        ),
        TextButton(
          onPressed: resetPassword,
          child: const Text('Reset password'),
        ),
      ],
    );
  }
}

// Инфо-раздел под формой
class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'To use all features, please log in. '
              'If you don’t have an account, you can register for free.',
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Register clicked')),
            );
          },
          child: const Text('Register'),
        ),
        const SizedBox(height: 25),
        const Text('Didn’t receive your verification email?'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Verify email clicked')),
            );
          },
          child: const Text('Verify email'),
        ),
      ],
    );
  }
}



/*
 **ListView** — список с прокруткой.
 **Scaffold** — структура страницы (каркас интерфейса).
 **Text** — отображение текста.
 **Column** — вертикальное размещение элементов.
 **Row** — горизонтальное размещение элементов.
 **Padding** — отступы вокруг элемента.
 **TextField** — поле ввода текста.
 **ElevatedButton** — приподнятая кнопка с фоном.
 **TextButton** — текстовая кнопка без фона.
 **StatefulWidget** — виджет с внутренним состоянием, может изменяться.
 **StatelessWidget** — виджет без состояния, отображает неизменяемый UI.

*/
