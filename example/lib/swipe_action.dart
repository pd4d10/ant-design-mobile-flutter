import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class SwipeActionExample extends StatelessWidget {
  const SwipeActionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '搭配列表使用',
          child: AntList(
            children: [
              for (final c in ['A', 'B', 'C'])
                AntSwipeAction(
                  leftActions: [
                    AntSwipeActionAction(
                      key: const ValueKey('pin'),
                      text: const Text('置顶'),
                    ),
                  ],
                  rightActions: [
                    AntSwipeActionAction(
                      key: const ValueKey('unsubscribe'),
                      text: const Text('取消关注'),
                    ),
                    AntSwipeActionAction(
                      key: const ValueKey('mute'),
                      text: const Text('免打扰'),
                    ),
                    AntSwipeActionAction(
                      key: const ValueKey('delete'),
                      text: const Text('删除'),
                    ),
                  ],
                  child: AntListItem(child: Text(c)),
                )
            ],
          ),
        ),
      ],
    );
  }
}
