import 'package:flutter/material.dart';

/// Главный экран профиля пользователя со списком настроек
class UserProfile extends StatelessWidget {
  // Первая группа пунктов меню
  final List<MenuRowData> firstMenuRow = const [
    MenuRowData(Icons.favorite_outline, 'Favorite'),
    MenuRowData(Icons.call, 'Call'),
    MenuRowData(Icons.computer, 'Devices'),
    MenuRowData(Icons.folder, 'Chat Folder'),
  ];

  // Вторая группа пунктов меню
  final List<MenuRowData> secondMenuRow = const [
    MenuRowData(Icons.notifications, 'Notifications'),
    MenuRowData(Icons.privacy_tip, 'Privacy'),
    MenuRowData(Icons.date_range, 'Calendar'),
    MenuRowData(Icons.brush, 'Themes'),
    MenuRowData(Icons.language, 'Language'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'), // Заголовок в верхней панели
      ),
      body: ListView( // Прокручиваемый список
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          UserInfo(), // Блок с аватаром и информацией о пользователе
          SizedBox(height: 30),
          MenuWidget(menuRow: firstMenuRow), // Первая группа настроек
          SizedBox(height: 30),
          MenuWidget(menuRow: secondMenuRow), // Вторая группа настроек
        ],
      ),
    );
  }
}

/// Модель пункта меню: иконка + текст
class MenuRowData {
  final IconData icon;
  final String text;

  const MenuRowData(this.icon, this.text);
}

/// Виджет для отображения группы пунктов меню
class MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const MenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final data in menuRow)
          MenuWidgetRow(data: data),
      ],
    );
  }
}

/// Один элемент меню
class MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const MenuWidgetRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(data.icon), // Иконка слева
      title: Text(data.text), // Текст посередине
      trailing: Icon(Icons.chevron_right_sharp), // Стрелка справа
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        // Здесь можно обработать нажатие
      },
    );
  }
}

/// Блок с информацией о пользователе
class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Аватар пользователя
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        SizedBox(height: 20),

        // Имя пользователя
        Text(
          'Naum',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),

        // Телефон пользователя
        Text(
          '+358 00 00 00',
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 10),

        // Никнейм пользователя
        Text('@naumdeveloper'),
      ],
    );
  }
}

