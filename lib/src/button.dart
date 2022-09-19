import 'package:antd_mobile/antd_mobile.dart';
import 'package:antd_mobile/src/_tapable.dart';
import 'package:flutter/widgets.dart';

enum AntButtonFill {
  solid,
  outline,
  none,
}

enum AntButtonShape {
  defaults,
  rounded,
  rectangular,
}

enum AntButtonSize {
  mini,
  small,
  middle,
  large,
}

class AntButton extends StatelessWidget {
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
    this.shape = AntButtonShape.defaults,
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

  static const _size = {
    AntButtonSize.mini: [3.0, AntTheme.fontSize5],
    AntButtonSize.small: [3.0, AntTheme.fontSize7],
    AntButtonSize.middle: [7.0, AntTheme.fontSize9],
    AntButtonSize.large: [11.0, AntTheme.fontSize10],
  };

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        fill == AntButtonFill.solid ? color : AntTheme.white;

    final borderColor = color == AntTheme.white
        ? AntTheme.border
        : fill == AntButtonFill.outline
            ? color
            : backgroundColor;

    final textColor = color == AntTheme.white
        ? AntTheme.text
        : fill == AntButtonFill.solid
            ? AntTheme.white
            : color;

    return Semantics(
      button: true,
      child: Tapable(
        onTap: onClick,
        disabled: disabled,
        builder: (active) {
          return Opacity(
            opacity: disabled ? .4 : 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    shape == AntButtonShape.defaults
                        ? 4
                        : shape == AntButtonShape.rectangular
                            ? 0
                            : 100, // TODO:
                  ),
                ),
                border: Border.all(color: borderColor),
                color: backgroundColor,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: _size[size]![0], horizontal: 12),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: textColor,
                        fontSize: _size[size]![1],
                      ),
                      child: IconTheme(
                        data: IconThemeData(color: textColor),
                        child: child,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Color.fromRGBO(0, 0, 0, active ? .08 : 0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
