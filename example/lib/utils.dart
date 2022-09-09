import 'package:flutter/widgets.dart';

class DemoBlock extends StatelessWidget {
  const DemoBlock({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ],
    );
  }
}
