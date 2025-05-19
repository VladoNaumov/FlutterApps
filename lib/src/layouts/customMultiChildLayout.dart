import 'package:flutter/material.dart';

class CostMultiChild extends StatelessWidget {
  const CostMultiChild({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomMultiChildLayout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('CustomMultiChildLayout')),
        body: MyLayout(),
      ),
    );
  }
}

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: MySimpleDelegate(),
      children: [
        // Центрированный контейнер
        LayoutId(
          id: 'center',
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
            child: const Center(child: Text('Центр')),
          ),
        ),
        // Контейнер в левом верхнем углу
        LayoutId(
          id: 'topLeft',
          child: Container(
            width: 80,
            height: 80,
            color: Colors.lightBlue,
            child: const Center(child: Text('Верх')),
          ),
        ),
        // Контейнер в правом нижнем углу
        LayoutId(
          id: 'bottomRight',
          child: Container(
            width: 80,
            height: 80,
            color: Colors.green,
            child: const Center(child: Text('Низ')),
          ),
        ),
      ],
    );
  }
}

class MySimpleDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // Центрируем элемент по центру родителя
    if (hasChild('center')) {
      final centerSize = layoutChild('center', BoxConstraints.loose(size));
      final centerOffset = Offset(
        (size.width - centerSize.width) / 2,
        (size.height - centerSize.height) / 2,
      );
      positionChild('center', centerOffset);
    }

    // Размещаем элемент в левом верхнем углу с отступом
    if (hasChild('topLeft')) {
      layoutChild('topLeft', BoxConstraints.loose(size));
      positionChild('topLeft', const Offset(10, 10));
    }

    // Размещаем элемент в правом нижнем углу с отступом
    if (hasChild('bottomRight')) {
      final bottomSize = layoutChild('bottomRight', BoxConstraints.loose(size));
      final bottomOffset = Offset(
        size.width - bottomSize.width - 10,
        size.height - bottomSize.height - 10,
      );
      positionChild('bottomRight', bottomOffset);
    }
  }
  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}
