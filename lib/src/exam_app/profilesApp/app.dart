import 'package:flutter/material.dart';
import 'userProfile.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      // AppBar + Color
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),

      // Главная страница
      home: UserProfile(),
    );
  }
}