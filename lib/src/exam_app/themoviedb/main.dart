import 'package:flutter/material.dart';
import 'widgets/auth/auth_widget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo ',
     theme: ThemeData(
         appBarTheme: AppBarTheme(
           backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
           titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
         )
     ),
     home: AuthWidget(),
   );
  }
}

/*
**AppBar** — верхняя панель с заголовком и кнопками
**ThemeData** — набор настроек оформления (цвета, шрифты).
**Material** — основа визуального стиля Material Design.
* */