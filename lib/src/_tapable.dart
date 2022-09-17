import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Tapable extends StatefulWidget {
  const Tapable({
    super.key,
    required this.builder,
    this.disabled = false,
    this.onTap,
  });

  final Widget Function(bool active) builder;
  final bool disabled;
  final GestureTapCallback? onTap;

  @override
  State<Tapable> createState() => _TapableState();
}

class _TapableState extends State<Tapable> {
  var _active = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.disabled ? MouseCursor.defer : SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          if (widget.disabled) return;

          setState(() {
            _active = true;
          });
        },
        onTapUp: (details) {
          if (widget.disabled) return;

          setState(() {
            _active = false;
          });
        },
        onTapCancel: () {
          if (widget.disabled) return;

          setState(() {
            _active = false;
          });
        },
        onTap: widget.disabled ? null : widget.onTap,
        child: widget.builder(_active),
      ),
    );
  }
}
