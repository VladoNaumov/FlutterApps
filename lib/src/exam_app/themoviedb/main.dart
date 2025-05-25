import 'package:flutter/material.dart';
import 'widgets/auth/auth_widget.dart';
import 'widgets/auth/auth_widget_easy.dart';



void main() => runApp(const MyApp());

// Корневой виджет приложения
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: const AuthWidget(), // теперь загружается логин
     // home: const LoginPage(), // теперь загружается логин
    );
  }

}

/*
**AppBar** — верхняя панель с заголовком и кнопками
**ThemeData** — набор настроек оформления (цвета, шрифты).
**Material** — основа визуального стиля Material Design.
* */