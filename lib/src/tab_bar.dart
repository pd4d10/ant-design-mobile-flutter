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
    final theme = AntTheme.of(context);
    return Container(
      color: theme.colorWhite,
      height: 49,
      child: Row(
        children: items.map((item) {
          final active = item.key == activeKey;
          final color = active ? theme.colorPrimary : theme.colorTextSecondary;

          final icon = (item.activeIcon != null && active)
              ? item.activeIcon!
              : (item.icon != null && !active)
                  ? item.icon!
                  : null;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onChange?.call(item.key);
              },
              child: Center(
                child: IconTheme(
                  data: IconThemeData(color: color, size: 24),
                  child: DefaultTextStyle(
                    style: TextStyle(color: color),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Stack(
                            children: [
                              icon,
                              if (item.badge != null)
                                Positioned(
                                  // right: 0, // TODO:
                                  // top: -6,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffff411c), // TODO:
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: theme.colorWhite,
                                        fontSize: theme.fontSize1,
                                        // height: 12,
                                      ),
                                      child: item.badge!,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        if (item.title != null) const SizedBox(height: 2),
                        if (item.title != null)
                          Text(
                            item.title!,
                            style: TextStyle(
                              fontSize: theme.fontSize2,
                              height: 1.5,
                              leadingDistribution: TextLeadingDistribution.even,
                            ),
                          ),
                      ],
                    ),
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
