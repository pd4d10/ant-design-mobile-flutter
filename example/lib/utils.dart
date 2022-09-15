import 'package:flutter/material.dart';

class DemoScaffold extends StatelessWidget {
  const DemoScaffold({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: const BoxDecoration(color: Color(0xfffafbfc)),
        // padding: const EdgeInsets.all(8.0),
        child: child,
      )),
    );
  }
}

class DemoBlock extends StatelessWidget {
  const DemoBlock({
    super.key,
    required this.title,
    required this.child,
    this.padding = 12,
  });

  final String title;
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xff697b8c)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ],
    );
  }
}
