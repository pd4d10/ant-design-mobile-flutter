import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AntList(
          header: Text('基础用法'),
          children: [
            AntListItem(child: Text('1')),
            AntListItem(child: Text('2')),
            AntListItem(child: Text('3')),
          ],
        ),
        AntList(
          header: const Text('可点击列表'),
          children: [
            AntListItem(
              prefix: const Icon(AntIcons.unorderedListOutline),
              child: const Text('账单'),
              onClick: () {},
            ),
            AntListItem(
              prefix: const Icon(AntIcons.payCircleOutline),
              child: const Text('总资产'),
              onClick: () {},
            ),
            AntListItem(
              prefix: const Icon(AntIcons.setOutline),
              child: const Text('设置'),
              onClick: () {},
            ),
          ],
        ),
        AntList(
          header: const Text('复杂列表'),
          children: [
            const AntListItem(
              extra: SizedBox.shrink(),
              child: Text('新消息通知'), // TODO: Switch
            ),
            AntListItem(
              onClick: () {},
              extra: const Text('未开启'),
              child: const Text('大字号模式'),
            ),
            AntListItem(
              description: const Text('管理已授权的产品和设备'),
              onClick: () {},
              child: const Text('授权管理'),
            ),
            AntListItem(
              title: const Text('副标题信息A'),
              description: const Text('副标题信息B'),
              onClick: () {},
              child: const Text('这里是主信息'),
            ),
          ],
        ),
        AntList(
          header: const Text('禁用状态'),
          children: [
            AntListItem(
              prefix: const Icon(AntIcons.unorderedListOutline),
              disabled: true,
              onClick: () {},
              child: const Text('账单'),
            ),
            const AntListItem(
              prefix: Icon(AntIcons.payCircleOutline),
              disabled: true,
              child: Text('总资产'),
            ),
          ],
        ),
        AntList(
          header: const Text('禁用状态'),
          mode: AntListMode.card,
          children: [
            AntListItem(
              extra: const Text('按照支付设置的顺序扣款'),
              onClick: () {},
              child: const Text('扣款方式'),
            ),
            AntListItem(
              extra: const Text('200元'),
              onClick: () {},
              child: const Text('月限额'),
            ),
            AntListItem(
              child: const Text('帮助中心'),
              onClick: () {},
            ),
            AntListItem(
              child: const Text('关闭服务'),
              onClick: () {},
            ),
          ],
        ),
      ],
    );
  }
}
