import 'package:flutter/material.dart';

// Главный виджет профиля пользователя
class UserProfile extends StatelessWidget {
  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite_outline, 'Favorite'),
    MenuRowData(Icons.call, 'Call'),
    MenuRowData(Icons.computer, 'Devices'),
    MenuRowData(Icons.folder, 'Chat Folder'),
  ];

  final List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Notifications'),
    MenuRowData(Icons.privacy_tip, 'Privacy'),
    MenuRowData(Icons.date_range, 'Calendar'),
    MenuRowData(Icons.brush, 'Themes'),
    MenuRowData(Icons.language, 'Language'),
  ];

  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView( // Добавлено прокручивание
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserInfo(),
            SizedBox(height: 30),
            MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 30),
            MenuWidget(menuRow: secondMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const MenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuRow.map((data) => MenuWidgetRow(data: data)).toList(),
    );
  }
}

class MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const MenuWidgetRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right_sharp),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          AvatarWidget(),
          SizedBox(height: 20),
          UserNameWidget(),
          SizedBox(height: 10),
          UserPhoneWidget(),
          SizedBox(height: 10),
          UserNickNameWidget(),
        ],
      ),
    );
  }
}

class UserNickNameWidget extends StatelessWidget {
  const UserNickNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('@naumdeveloper');
  }
}

class UserPhoneWidget extends StatelessWidget {
  const UserPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('+358 00 00 00');
  }
}

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Naum', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey[300],
      child: Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

/*
Что улучшено:
✅ Заменены width на height в SizedBox для Column.

✅ Добавлен SingleChildScrollView, чтобы экран был прокручиваемым.

✅ Заменён Placeholder на CircleAvatar для аватара.

✅ Уточнены подписи элементов меню.

✅ Добавлены стили к имени пользователя для выделения.
* */