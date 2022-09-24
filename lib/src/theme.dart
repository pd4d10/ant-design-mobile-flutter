import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

const _kColorPrimary = Color(0xff1677ff);
const _kColorSuccess = Color(0xff00b578);
const _kColorWarning = Color(0xffff8f1f);
const _kColorDanger = Color(0xffff3141);
const _kColorWhite = Color(0xffffffff);
const _kColorText = Color(0xff333333);
const _kColorTextSecondary = Color(0xff666666);
const _kColorWeak = Color(0xff999999);
const _kColorLight = Color(0xffcccccc);
const _kColorBorder = Color(0xffeeeeee);
const _kColorBox = Color(0xfff5f5f5);
const _kColorBackground = Color(0xffffffff);

const _kColorPrimaryDark = Color(0xff3086ff);
const _kColorSuccessDark = Color(0xff34b368);
const _kColorWarningDark = Color(0xffffa930);
const _kColorDangerDark = Color(0xffff4a58);
const _kColorWhiteDark = Color(0xffffffff);
const _kColorTextDark = Color(0xffe6e6e6);
const _kColorTextSecondaryDark = Color(0xffb3b3b3);
const _kColorWeakDark = Color(0xff808080);
const _kColorLightDark = Color(0xff4d4d4d);
const _kColorBorderDark = Color(0xff2b2b2b);
const _kColorBoxDark = Color(0xff0a0a0a);
const _kColorBackgroundDark = Color(0xff1a1a1a);

/// https://github.com/ant-design/ant-design-mobile/blob/v5.22.0/src/global/theme-default.less
class AntThemeData {
  const AntThemeData({
    required this.brightness,
    this.radiusS = 4,
    this.radiusM = 8,
    this.radiusL = 12,
    this.fontSize1 = 9.0,
    this.fontSize2 = 10.0,
    this.fontSize3 = 11.0,
    this.fontSize4 = 12.0,
    this.fontSize5 = 13.0,
    this.fontSize6 = 14.0,
    this.fontSize7 = 15.0,
    this.fontSize8 = 16.0,
    this.fontSize9 = 17.0,
    this.fontSize10 = 18.0,
    this.colorPrimary = const Color(0xff1677ff),
    this.colorSuccess = const Color(0xff00b578),
    this.colorWarning = const Color(0xffff8f1f),
    this.colorDanger = const Color(0xffff3141),
    this.colorWhite = const Color(0xffffffff),
    this.colorText = const Color(0xff333333),
    this.colorTextSecondary = const Color(0xff666666),
    this.colorWeak = const Color(0xff999999),
    this.colorLight = const Color(0xffcccccc),
    this.colorBorder = const Color(0xffeeeeee),
    this.colorBox = const Color(0xfff5f5f5),
    this.colorBackground = const Color(0xffffffff),
    this.fontSizeMain = 13.0,
  });

  final Brightness brightness;

  final double radiusS;
  final double radiusM;
  final double radiusL;

  final double fontSize1;
  final double fontSize2;
  final double fontSize3;
  final double fontSize4;
  final double fontSize5;
  final double fontSize6;
  final double fontSize7;
  final double fontSize8;
  final double fontSize9;
  final double fontSize10;

  final Color colorPrimary;
  final Color colorSuccess;
  final Color colorWarning;
  final Color colorDanger;

  final Color colorWhite;
  final Color colorText;
  final Color colorTextSecondary;
  final Color colorWeak;
  final Color colorLight;
  final Color colorBorder;
  final Color colorBox;
  final Color colorBackground;

  final double fontSizeMain;
}

class AntTheme extends InheritedWidget {
  const AntTheme({
    super.key,
    required super.child,
    required this.data,
  });

  final AntThemeData data;

  static AntThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AntTheme>();
    final brightness =
        theme?.data.brightness ?? MediaQuery.of(context).platformBrightness;

    return AntThemeData(
      brightness: brightness,
      colorPrimary:
          brightness == Brightness.light ? _kColorPrimary : _kColorPrimaryDark,
      colorSuccess:
          brightness == Brightness.light ? _kColorSuccess : _kColorSuccessDark,
      colorWarning:
          brightness == Brightness.light ? _kColorWarning : _kColorWarningDark,
      colorDanger:
          brightness == Brightness.light ? _kColorDanger : _kColorDangerDark,
      colorWhite:
          brightness == Brightness.light ? _kColorWhite : _kColorWhiteDark,
      colorText: brightness == Brightness.light ? _kColorText : _kColorTextDark,
      colorTextSecondary: brightness == Brightness.light
          ? _kColorTextSecondary
          : _kColorTextSecondaryDark,
      colorWeak: brightness == Brightness.light ? _kColorWeak : _kColorWeakDark,
      colorLight:
          brightness == Brightness.light ? _kColorLight : _kColorLightDark,
      colorBorder:
          brightness == Brightness.light ? _kColorBorder : _kColorBorderDark,
      colorBox: brightness == Brightness.light ? _kColorBox : _kColorBoxDark,
      colorBackground: brightness == Brightness.light
          ? _kColorBackground
          : _kColorBackgroundDark,
    );
  }

  @override
  bool updateShouldNotify(AntTheme oldWidget) {
    return oldWidget.data != data;
  }
}
