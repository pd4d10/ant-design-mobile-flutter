import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntTabBarItem {
  const AntTabBarItem({
    required this.key,
    this.title,
    this.icon,
    Widget? activeIcon,
    this.badge,
  }) : activeIcon = activeIcon ?? icon;

  final String key;
  final String? title;
  final Widget? icon;
  final Widget? activeIcon;
  final Widget? badge;
}

class AntTabBar extends StatelessWidget {
  const AntTabBar({
    super.key,
    required this.items,
    required this.activeKey,
    this.defaultActiveKey,
    this.onChange,
  });

  final List<AntTabBarItem> items;

  /// key of currently active item
  final String activeKey;

  ///	The initialized key of the selected item, if the activeKey is not set
  final String? defaultActiveKey;

  ///	Callback when switching panel
  final void Function(String key)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AntTheme.of(context).colorWhite,
      height: 49,
      child: Row(
        children: items.map((item) {
          final active = item.key == activeKey;
          final color = active
              ? AntTheme.of(context).colorPrimary
              : AntTheme.of(context).colorTextSecondary;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onChange?.call(item.key);
              },
              child: IconTheme(
                data: IconThemeData(color: color, size: 24),
                child: DefaultTextStyle(
                  style: TextStyle(color: color),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (item.icon != null && !active) item.icon!,
                      if (item.activeIcon != null && active) item.activeIcon!,
                      if (item.title != null) const SizedBox(height: 2),
                      if (item.title != null)
                        Text(
                          item.title!,
                          style: TextStyle(
                            fontSize: AntTheme.of(context).fontSize2,
                            height: 1.5,
                          ),
                        ),
                      // if (item.badge != null) item.badge!,
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
