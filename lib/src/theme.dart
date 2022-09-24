import 'package:flutter/widgets.dart';

/// https://github.com/ant-design/ant-design-mobile/blob/v5.22.0/src/global/theme-default.less
class AntThemeData {
  const AntThemeData({
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
    return theme?.data ?? const AntThemeData();
  }

  @override
  bool updateShouldNotify(AntTheme oldWidget) {
    return oldWidget.data != data;
  }
}
