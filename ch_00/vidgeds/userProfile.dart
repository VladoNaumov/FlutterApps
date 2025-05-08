import 'package:flutter/material.dart';

// Главный виджет профиля пользователя
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель с заголовком
      appBar: AppBar(
        title: Text('Settings'), // Заголовок "Настройки"
      ),

      // Основное тело экрана
      body: Container(
        width: double.infinity, // Занимает всю ширину
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Содержимое сверху
          crossAxisAlignment: CrossAxisAlignment.center, // По центру по горизонтали
          children: [
            SizedBox(height: 30), // Отступ сверху
            AvatarWidget(),       // Виджет аватара
            SizedBox(height: 30),
            UserNameWidget(),     // Имя пользователя
            SizedBox(height: 10),
            UserPhoneWidget(),    // Телефон пользователя
            SizedBox(height: 10),
            UserNickNameWidget(), // Никнейм пользователя
          ],
        ),
      ),
    );
  }
}

// Виджет никнейма пользователя
class UserNickNameWidget extends StatelessWidget {
  const UserNickNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('@naumdeveloper'); // Просто текст с ником
  }
}

// Виджет телефона пользователя
class UserPhoneWidget extends StatelessWidget {
  const UserPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('+358 00 00 00'); // Просто текст с телефоном
  }
}

// Виджет имени пользователя
class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Naum'); // Просто текст с именем
  }
}

// Виджет аватара пользователя
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Placeholder(), // Заглушка для аватара (можно заменить на изображение)
    );
  }
}
