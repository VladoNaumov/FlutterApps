import 'package:flutter/material.dart';

void main() => runApp(ProfileApp());

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
  State<ProfileGridPage> createState() => _ProfileGridPageState();
}

class _ProfileGridPageState extends State<ProfileGridPage> {
  /// Список профилей, инициализируется 25 профилями.
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
      body: GridView.builder(
        padding: const EdgeInsets.all(8),

        // Определяет, как будет выглядеть сетка:
        // здесь фиксированное количество колонок — 3.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,           // Количество колонок в сетке
          mainAxisSpacing: 8,          // Вертикальные отступы между элементами
          crossAxisSpacing: 8,         // Горизонтальные отступы между элементами
        ),

        itemCount: profiles.length,     // Количество элементов в сетке

        // Ленивая генерация виджетов по индексу.
        // Это экономит память, потому что не создаёт все элементы сразу.
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 60),
              const SizedBox(height: 4),
              Text(profile.name, style: const TextStyle(fontSize: 14)),
            ],
          );
        },
      ),
    );
  }
}

/*
### `ListView.builder` vs `GridView.builder`:

* **`ListView.builder`** — используется для вертикальных или горизонтальных списков **в один столбец**.
* **`GridView.builder`** — используется для **сеток** с несколькими колонками (как в твоем случае `crossAxisCount: 3`).

Так как ты отображаешь **сетку** профилей, логично использовать `GridView.builder`.

Если бы ты показывал просто вертикальный список пользователей (один под другим), тогда бы подошёл `ListView.builder`.

Примеры:

* **Сетка (n колонок)** → `GridView.builder`
* **Простой список** → `ListView.builder`

* */