import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class InputExample extends StatefulWidget {
  const InputExample({super.key});

  @override
  State<InputExample> createState() => _InputExampleState();
}

class _InputExampleState extends State<InputExample> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '基础用法',
          child: AntInput(
            controller: _controller,
            placeholder: '请输入内容',
          ),
        ),
        DemoBlock(
          title: '带清除按钮',
          child: AntInput(
            controller: _controller,
            placeholder: '请输入内容',
            clearable: true,
          ),
        ),
        DemoBlock(
          title: '输入内容右对齐',
          child: AntInput(
            controller: _controller,
            placeholder: '请输入内容',
            clearable: true,
            textAlign: TextAlign.end,
          ),
        ),
        DemoBlock(
          title: '只读状态',
          child: AntInput(
            controller: TextEditingController(text: '只读模式的输入框'),
            readOnly: true,
          ),
        ),
        DemoBlock(
          title: '禁用状态',
          child: AntInput(
            controller: TextEditingController(text: '被禁用的输入框'),
            disabled: true,
          ),
        ),
      ],
    );
  }
}
