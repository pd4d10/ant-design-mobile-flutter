import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntTag extends StatelessWidget {
  const AntTag({
    super.key,
    required this.child,
    this.color = const Color(0xff666666),
    this.outline = false,
    this.round = false,
  });

  final Widget child;

  final Color color;

  final bool outline;

  final bool round;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: outline ? null : color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(round ? 100 : 2)),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: AntTheme.fontSize3,
          height: 1,
          color: outline ? color : AntTheme.white,
        ),
        child: child,
      ),
    );
  }
}
