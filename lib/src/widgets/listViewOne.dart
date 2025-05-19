import 'package:flutter/material.dart';

void main() => runApp(ListViewRun());

class ListViewRun extends StatelessWidget {
  const ListViewRun({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',

      // Настройка темы, в частности AppBar.
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),

      home: const ListViewOne(),
    );
  }
}


class ListViewOne extends StatelessWidget{
  const ListViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold — нужен для отображения базовой структуры экрана (AppBar, body и др.)
    return Scaffold(
        appBar: AppBar(
            title: const Text('ListView Example')
        ),

        body:  ListView(
          children: [
            Container (

            ),

            Container (

            ),

          ],
        ),
    );
  }
}