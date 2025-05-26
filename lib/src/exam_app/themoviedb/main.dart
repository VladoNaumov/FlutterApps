import 'package:flutter/material.dart';
import 'widgets/auth/auth_widget.dart';
import 'widgets/main_screen/main_sceen_widget.dart';

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
    routes: {
        '/autch': (context)=>AuthWidget(),
        '/main_screen': (context)=>MainScreenWidget(),
    },
    initialRoute: '/autch'
    );
  }

}

/*
**AppBar** — верхняя панель с заголовком и кнопками
**ThemeData** — набор настроек оформления (цвета, шрифты).
**Material** — основа визуального стиля Material Design.
* */