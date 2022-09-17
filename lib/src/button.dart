import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

enum AntButtonFill {
  solid,
  outline,
  none,
}

enum AntButtonShape {
  defaultValue,
  rounded,
  rectangular,
}

enum AntButtonSize {
  mini,
  small,
  middle,
  large,
}

class AntButton extends StatefulWidget {
  const AntButton({
    Key? key,
    required this.child,
    this.block = false,
    this.color = AntTheme.white,
    this.disabled = false,
    this.fill = AntButtonFill.solid,
    this.loading = false,
    this.loadingIcon = const Text('loading'),
    this.loadingText,
    this.onClick,
    this.shape = AntButtonShape.defaultValue,
    this.size = AntButtonSize.middle,
  }) : super(key: key);

  final Widget child;

  /// Should the button displays as block element.
  final bool block;

  /// The color of the button.
  final Color color;

  /// Should the button be disabled.
  final bool disabled;

  /// The fill mode.
  final AntButtonFill fill;

  /// Should the button displays as loading state.
  final bool loading;

  /// The customized icon in loading state.
  final Widget loadingIcon;

  /// The extra text displayed in loading state.
  final String? loadingText;

  /// The click event.
  final VoidCallback? onClick;

  /// The shape of the button.
  final AntButtonShape shape;

  /// The size of the button.
  final AntButtonSize size;

  @override
  State<AntButton> createState() => _AntButtonState();
}

class _AntButtonState extends State<AntButton>
    with SingleTickerProviderStateMixin {
  var _active = false;

  static const _size = {
    AntButtonSize.mini: [3.0, AntTheme.fontSize5],
    AntButtonSize.small: [3.0, AntTheme.fontSize7],
    AntButtonSize.middle: [7.0, AntTheme.fontSize9],
    AntButtonSize.large: [11.0, AntTheme.fontSize10],
  };

  @override
  Widget build(BuildContext context) {
    final bool enabled = !widget.disabled;
    final backgroundColor =
        widget.fill == AntButtonFill.solid ? widget.color : AntTheme.white;

    var borderColor =
        widget.fill == AntButtonFill.outline ? widget.color : backgroundColor;
    if (widget.color == AntTheme.white) borderColor = AntTheme.border;

    var textColor = widget.color;
    if (widget.fill == AntButtonFill.solid) textColor = AntTheme.white;
    if (widget.color == AntTheme.white) textColor = AntTheme.text;

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTapDown: (details) {
          if (enabled) {
            setState(() {
              _active = true;
            });
          }
        },
        onTapUp: (details) {
          if (enabled) {
            setState(() {
              _active = false;
            });
          }
        },
        onTapCancel: () {
          if (enabled) {
            setState(() {
              _active = false;
            });
          }
        },
        onTap: widget.onClick,
        child: Semantics(
          button: true,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: borderColor),
              color: backgroundColor,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _size[widget.size]![0], horizontal: 12),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        color: textColor, fontSize: _size[widget.size]![1]),
                    child: IconTheme(
                      data: IconThemeData(color: textColor),
                      child: widget.child,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, _active ? .08 : 0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
