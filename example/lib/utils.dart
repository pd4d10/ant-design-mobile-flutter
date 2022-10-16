import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

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
            style: TextStyle(
              fontSize: 14,
              color: AntTheme.of(context).colorText,
            ),
          ),
        ),
        Container(
          color: AntTheme.of(context).colorBackground,
          padding: EdgeInsets.all(padding),
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ],
    );
  }
}
