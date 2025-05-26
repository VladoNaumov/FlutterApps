// TODO  "UI interface Login and Password"

import 'package:flutter/material.dart';


final color = const Color(0xFF01B4E4); // основной цвет

final buttonStyle = ElevatedButton.styleFrom(
  foregroundColor: color,
  backgroundColor: Colors.white,
  elevation: 0,
);

final textFieldDecoration = const InputDecoration(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
);

const textStyle = TextStyle(fontSize: 16, color: Colors.black);

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login to your account')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const _FormWidget(),
        const SizedBox(height: 25),
        const Text(
          'In order to use the editing and rating capabilities of TMDB, '
              'as well as get personal recommendations you will need to login to your account. '
              'If you do not have an account, registering for an account is free and simple.',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            // TODO: Register action
          },
          style: buttonStyle, // Применяем общий стиль
          child: const Text('Register'),
        ),
        const SizedBox(height: 25),
        const Text(
          'If you signed up but didn\'t get your verification email.',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            // TODO: Verify email action
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: color,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          child: const Text('Verify email'),
        ),
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController =  TextEditingController();
  final _passwordTextController =  TextEditingController();

  void _auch() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
     Navigator.of(context).pushReplacementNamed('/main_screen');
    }
  }

  void _resetPasword(){
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Username', style: textStyle),
        const SizedBox(height: 5),
        TextField(
            controller: _loginTextController,
            decoration: textFieldDecoration
        ),
        const SizedBox(height: 20),
        const Text('Password', style: textStyle),
        const SizedBox(height: 5),
        TextField(
            controller: _passwordTextController,
            decoration: textFieldDecoration,
            obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _auch, // TODO: Login action
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: _resetPasword, // TODO: Reset password
              style: TextButton.styleFrom(
                foregroundColor: color,
              ),
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}

/*
 **AppBar** — верхняя панель с заголовком и кнопками.
 **ListView** — список с прокруткой.
 **Scaffold** — структура страницы (каркас интерфейса).
 **Text** — отображение текста.
 **TextStyle** — стиль текста (размер, цвет, жирность и т.д.).
 **Column** — вертикальное размещение элементов.
 **Row** — горизонтальное размещение элементов.
 **Padding** — отступы вокруг элемента.
 **SizedBox** — пустое пространство между элементами (для отступов).
 **TextField** — поле ввода текста.
 **InputDecoration** — оформление поля ввода (границы, отступы).
 **OutlineInputBorder** — граница для поля ввода.
 **ElevatedButton** — приподнятая кнопка с фоном.
 **TextButton** — текстовая кнопка без фона.
 **foregroundColor** — цвет текста и иконок в кнопке.
 **backgroundColor** — цвет фона кнопки.
 **RoundedRectangleBorder** — скругление углов кнопки.
 **EdgeInsets** — внутренние отступы (например, EdgeInsets.symmetric).
 **StatefulWidget** — виджет с внутренним состоянием, может изменяться.
 **StatelessWidget** — виджет без состояния, отображает неизменяемый UI.

*/
