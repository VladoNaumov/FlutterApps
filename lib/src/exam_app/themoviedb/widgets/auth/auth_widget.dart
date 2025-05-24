import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget{
  const AuthWidget({super.key});

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your account')
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
        fontSize: 16,
        color: Colors.black
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
      children: [
        SizedBox(height: 25,),
        Text(
            'In order to use the editing and rating capabilities of TMDB, '
                'as well as get personal recommendations you will need to login to your account. '
                'If you do not have an account, registering for an account is free and simple. ',
          style: textStyle,
        ),
        SizedBox(height: 25,),
        Text(
            'f you signed up but didnt get your verification email.',
          style: textStyle,
        ),
      ],
    ),
    );
  }
}