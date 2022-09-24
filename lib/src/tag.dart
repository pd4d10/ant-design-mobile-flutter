import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

enum AntTagFill {
  solid,
  outline,
}

class AntTag extends StatelessWidget {
  const AntTag({
    super.key,
    required this.child,
    this.color = const Color(0xff666666),
    this.fill = AntTagFill.solid,
    this.round = false,
  });

  final Widget child;

  final Color color;

  final AntTagFill fill;

  final bool round;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: fill == AntTagFill.outline ? null : color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(round ? 100 : 2)),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: AntTheme.of(context).fontSize3,
          height: 1,
          color: fill == AntTagFill.outline
              ? color
              : AntTheme.of(context).colorWhite,
        ),
        child: child,
      ),
    );
  }
}
