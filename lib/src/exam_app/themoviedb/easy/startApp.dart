import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'mainSccreen.dart';


void main() {
  runApp(const MyApp());
}

// Основное приложение с Material 3
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/main_screen': (context) => const MainScreen(),
      },
    );
  }
}

/*
**AppBar** — верхняя панель с заголовком и кнопками
**ThemeData** — набор настроек оформления (цвета, шрифты).
**Material** — основа визуального стиля Material Design.
* */