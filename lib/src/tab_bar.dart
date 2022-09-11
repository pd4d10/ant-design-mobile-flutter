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
      color: AntTheme.white,
      height: 49,
      child: Row(
        children: items.map((item) {
          final active = item.key == activeKey;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                onChange?.call(item.key);
              },
              child: DefaultTextStyle(
                style: TextStyle(
                  color: active ? AntTheme.primary : AntTheme.text,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item.icon != null && !active) item.icon!,
                    if (item.activeIcon != null && active) item.activeIcon!,
                    if (item.title != null) const SizedBox(height: 2),
                    if (item.title != null)
                      Text(
                        item.title!,
                        style: const TextStyle(
                          fontSize: AntTheme.fontSize2,
                          height: 1.5,
                        ),
                      ),
                    // if (item.badge != null) item.badge!,
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
