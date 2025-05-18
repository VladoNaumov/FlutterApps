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
        appBar: AppBar(title: const Text('CustomMultiChildLayout')),
        body: const MyLayout(),
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
        LayoutId(
          id: 'center',
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
            child: const Center(child: Text('Центр')),
          ),
        ),
        LayoutId(
          id: 'topLeft',
          child: Container(
            width: 80,
            height: 80,
            color: Colors.lightBlue,
            child: const Center(child: Text('Верх')),
          ),
        ),
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
    if (hasChild('center')) {
      final centerSize = layoutChild('center', BoxConstraints.loose(size));
      positionChild(
        'center',
        Offset(
          (size.width - centerSize.width) / 2,
          (size.height - centerSize.height) / 2,
        ),
      );
    }

    if (hasChild('topLeft')) {
      final topSize = layoutChild('topLeft', BoxConstraints.loose(size));
      positionChild('topLeft', const Offset(10, 10)); // отступ от угла
    }

    if (hasChild('bottomRight')) {
      final bottomSize = layoutChild('bottomRight', BoxConstraints.loose(size));
      positionChild(
        'bottomRight',
        Offset(
          size.width - bottomSize.width - 10,
          size.height - bottomSize.height - 10,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}