import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class ActionSheetExample extends StatelessWidget {
  const ActionSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '基础用法',
          child: Wrap(
            children: [
              AntButton(
                child: const Text('最简单的用法'),
                onClick: () {
                  AntActionSheet.show(
                    context: context,
                    actions: [
                      const AntActionSheetAction(key: 'copy', text: Text('复制')),
                      const AntActionSheetAction(key: 'edit', text: Text('修改')),
                      const AntActionSheetAction(key: 'save', text: Text('保存')),
                    ],
                  );
                },
              ),
              AntButton(
                child: const Text('取消按钮和额外描述'),
                onClick: () {
                  AntActionSheet.show(
                    context: context,
                    actions: [
                      const AntActionSheetAction(key: 'copy', text: Text('复制')),
                      const AntActionSheetAction(key: 'edit', text: Text('修改')),
                      const AntActionSheetAction(key: 'save', text: Text('保存')),
                    ],
                    extra: const Text('请选择你要进行的操作'),
                    cancelText: const Text('取消'),
                  );
                },
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '选项状态',
          child: AntButton(
            child: const Text('禁用和危险的选项'),
            onClick: () {
              AntActionSheet.show(
                context: context,
                actions: [
                  const AntActionSheetAction(key: 'copy', text: Text('复制')),
                  const AntActionSheetAction(
                    key: 'edit',
                    text: Text('修改'),
                    disabled: true,
                  ),
                  const AntActionSheetAction(
                    key: 'delete',
                    text: Text(
                      '删除',
                      style: TextStyle(
                        color: AntTheme.danger,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    description: Text('删除后数据不可恢复'),
                  ),
                ],
                extra: const Text('请选择你要进行的操作'),
                cancelText: const Text('取消'),
              );
            },
          ),
        ),
        DemoBlock(
          title: '事件处理',
          child: AntButton(
            child: const Text('事件处理'),
            onClick: () async {
              final value = await AntActionSheet.show(
                context: context,
                actions: [
                  const AntActionSheetAction(key: 'copy', text: Text('复制')),
                  const AntActionSheetAction(key: 'edit', text: Text('修改')),
                  AntActionSheetAction(
                    key: 'save',
                    text: const Text('保存'),
                    onClick: () {
                      // TODO: dialog confirm
                    },
                  ),
                ],
              );

              await AntToast.show(
                context,
                content: Text('点击了 $value'),
              );
            },
          ),
        ),
      ],
    );
  }
}
