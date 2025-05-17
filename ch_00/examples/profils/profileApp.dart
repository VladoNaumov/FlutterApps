import 'package:flutter/material.dart';

/// Модель профиля с идентификатором и именем.
class Profile {
  final int id;
  final String name;

  Profile({required this.id, required this.name});
}

/// Основное приложение, запускающее [ProfileGridPage].
class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileGridPage(),
    );
  }
}

/// Страница, отображающая сетку профилей.
class ProfileGridPage extends StatefulWidget {
  const ProfileGridPage({super.key});

  @override
  State<ProfileGridPage> createState() {
    return _ProfileGridPageState();
  }
}

class _ProfileGridPageState extends State<ProfileGridPage> {
  /// Список профилей, инициализируется 50 профилями.
  final List<Profile> profiles = List.generate(
    25,
        (index) => Profile(id: index, name: 'User $index'),
  );

  /*
    final List<Profile> profiles = [
    Profile(id: 1, name: 'Алексей'),
    Profile(id: 2, name: 'Мария'),
    Profile(id: 3, name: 'Иван'),
    ]
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профили'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: profiles.map((profile) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 60),
              const SizedBox(height: 4),
              Text(profile.name, style: const TextStyle(fontSize: 14)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

