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
        AntList(
          header: const Text('基础用法'),
          items: [
            AntListItem(child: const Text('1')),
            AntListItem(child: const Text('2')),
            AntListItem(child: const Text('3')),
          ],
        ),
        AntList(
          header: const Text('可点击列表'),
          items: [
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
          items: [
            AntListItem(
              child: const Text('新消息通知'),
              extra: const SizedBox.shrink(), // TODO: Switch
            ),
            AntListItem(
              child: const Text('大字号模式'),
              onClick: () {},
              extra: const Text('未开启'),
            ),
            AntListItem(
              child: const Text('授权管理'),
              description: const Text('管理已授权的产品和设备'),
              onClick: () {},
            ),
            AntListItem(
              child: const Text('这里是主信息'),
              title: const Text('副标题信息A'),
              description: const Text('副标题信息B'),
              onClick: () {},
            ),
          ],
        ),
        AntList(
          header: const Text('禁用状态'),
          items: [
            AntListItem(
              prefix: const Icon(AntIcons.unorderedListOutline),
              child: const Text('账单'),
              disabled: true,
              onClick: () {},
            ),
            AntListItem(
              prefix: const Icon(AntIcons.payCircleOutline),
              child: const Text('总资产'),
              disabled: true,
            ),
          ],
        ),
        AntList(
          header: const Text('禁用状态'),
          mode: AntListMode.card,
          items: [
            AntListItem(
              child: const Text('扣款方式'),
              extra: const Text('按照支付设置的顺序扣款'),
              onClick: () {},
            ),
            AntListItem(
              child: const Text('月限额'),
              extra: const Text('200元'),
              onClick: () {},
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
