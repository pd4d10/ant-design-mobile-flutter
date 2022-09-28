import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  static const items = [
    AntTabBarItem(
      key: 'home',
      title: '首页',
      icon: Icon(AntIcons.appOutline),
    ),
    AntTabBarItem(
      key: 'todo',
      title: '待办',
      icon: Icon(AntIcons.unorderedListOutline),
      badge: Text('5'),
    ),
    AntTabBarItem(
      key: 'message',
      title: '消息',
      icon: Icon(AntIcons.messageOutline),
      activeIcon: Icon(AntIcons.messageFill),
      badge: Text('99+'),
    ),
    AntTabBarItem(
      key: 'personalCenter',
      title: '我的',
      icon: Icon(AntIcons.userOutline),
    ),
  ];

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> {
  var _active = TabBarExample.items[0].key;

  void _handleChange(String key) {
    setState(() {
      _active = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '基础用法',
          padding: 0,
          child: AntTabBar(
            activeKey: _active,
            items: [
              for (final e in TabBarExample.items)
                AntTabBarItem(
                  key: e.key,
                  title: e.title,
                  icon: e.icon,
                  activeIcon: e.activeIcon,
                )
            ],
            onChange: _handleChange,
          ),
        ),
        DemoBlock(
          title: '徽标',
          padding: 0,
          child: AntTabBar(
            activeKey: _active,
            items: TabBarExample.items,
            onChange: _handleChange,
          ),
        ),
        DemoBlock(
          title: '仅图标',
          padding: 0,
          child: AntTabBar(
            activeKey: _active,
            items: [
              for (final e in TabBarExample.items)
                AntTabBarItem(
                  key: e.key,
                  icon: e.icon,
                  activeIcon: e.activeIcon,
                )
            ],
            onChange: _handleChange,
          ),
        ),
        DemoBlock(
          title: '仅标题',
          padding: 0,
          child: AntTabBar(
            activeKey: _active,
            items: [
              for (final e in TabBarExample.items)
                AntTabBarItem(
                  key: e.key,
                  title: e.title,
                )
            ],
            onChange: _handleChange,
          ),
        ),
      ],
    );
  }
}
