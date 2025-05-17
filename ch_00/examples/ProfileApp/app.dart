import 'package:flutter/material.dart';
import 'userProfile.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColor, // Явно используем основной цвет
          //backgroundColor: Colors.blue, // Прямо задаём цвет тулбара
        ),
      ),
      home: UserProfile(),
    );
  }
}

