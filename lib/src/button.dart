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
    super.key,
    required this.child,
    this.block = false,
    this.color,
    this.disabled = false,
    this.fill = AntButtonFill.solid,
    this.loading = false,
    this.loadingIcon = const Text('loading'),
    this.loadingText,
    this.onClick,
    this.shape = AntButtonShape.defaults,
    this.size = AntButtonSize.middle,
  });

  final Widget child;

  /// Should the button displays as block element.
  final bool block;

  /// The color of the button.
  final Color? color;

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

  static const _transparent = Color(0x00000000);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);
    final finalColor = color ?? theme.colorBackground;

    final backgroundColor =
        fill == AntButtonFill.solid ? finalColor : _transparent;

    final borderColor = color == null
        ? theme.colorBorder
        : fill == AntButtonFill.outline
            ? finalColor
            : backgroundColor;

    final textColor = color == null
        ? theme.colorText
        : fill == AntButtonFill.solid
            ? theme.colorWhite
            : finalColor;

    final sizeMap = {
      AntButtonSize.mini: [3.0, theme.fontSize5],
      AntButtonSize.small: [3.0, theme.fontSize7],
      AntButtonSize.middle: [7.0, theme.fontSize9],
      AntButtonSize.large: [11.0, theme.fontSize10],
    };

    return Semantics(
      button: true,
      child: SizedBox(
        width: block ? double.infinity : null,
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
                  border: fill == AntButtonFill.none
                      ? null
                      : Border.all(color: borderColor),
                  color: backgroundColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: sizeMap[size]![0], horizontal: 12),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: textColor,
                          fontSize: sizeMap[size]![1],
                        ),
                        child: IconTheme(
                          data: IconThemeData(color: textColor),
                          child: block ? Center(child: child) : child,
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
      ),
    );
  }
}
