import 'dart:async';

import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class ToastExample extends StatelessWidget {
  const ToastExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '基础用法',
          child: AntButton(
            child: const Text('轻提示'),
            onClick: () {
              AntToast.show(context, content: const Text('Hello World'));
            },
          ),
        ),
        DemoBlock(
          title: '图标',
          child: Wrap(
            spacing: 8,
            children: [
              AntButton(
                child: const Text('成功'),
                onClick: () {
                  AntToast.show(
                    context,
                    content: const Text('保存成功'),
                    icon: const Icon(AntIcons.checkOutline),
                  );
                },
              ),
              AntButton(
                child: const Text('失败'),
                onClick: () {
                  AntToast.show(
                    context,
                    content: const Text('名称已存在'),
                    icon: const Icon(AntIcons.closeOutline),
                  );
                },
              ),
              AntButton(
                child: const Text('加载中'),
                onClick: () {
                  AntToast.show(
                    context,
                    content: const Text('加载中…'),
                    icon: const Icon(AntIcons.payCircleOutline), // TODO: spin
                  );
                },
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '更多功能',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                child: const Text('顶部提示'),
                onClick: () {
                  AntToast.show(
                    context,
                    content: const Text('Hello World'),
                    position: AntToastPosition.top,
                  );
                },
              ),
              AntButton(
                child: const Text('底部提示'),
                onClick: () {
                  AntToast.show(
                    context,
                    content: const Text('Hello World'),
                    position: AntToastPosition.bottom,
                  );
                },
              ),
              AntButton(
                child: const Text('阻止背景点击'), // TODO:
                onClick: () {
                  AntToast.show(
                    context,
                    content: const Text('请耐心等待, 不要退出'),
                    maskClickable: false,
                  );
                },
              ),
              AntButton(
                child: const Text('动态内容'),
                onClick: () {
                  AntToast.show(
                    context,
                    content: const CountDownText(),
                    duration: const Duration(seconds: 5),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CountDownText extends StatefulWidget {
  const CountDownText({super.key});

  @override
  State<CountDownText> createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  var _count = 5;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (t) {
      if (mounted) {
        setState(() {
          _count--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('还剩 $_count 秒');
  }
}
