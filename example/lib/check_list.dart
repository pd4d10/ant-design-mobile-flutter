import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class CheckListExample extends StatefulWidget {
  const CheckListExample({super.key});

  @override
  State<CheckListExample> createState() => _CheckListExampleState();
}

class _CheckListExampleState extends State<CheckListExample> {
  var _value0 = ['B'];
  var _value1 = ['B', 'C'];
  var _value2 = ['B'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '基础用法',
          padding: 0,
          child: AntCheckList(
            value: _value0,
            onChange: (value) {
              setState(() {
                _value0 = value;
              });
            },
            items: [
              AntCheckListItem(value: 'A'),
              AntCheckListItem(value: 'B'),
              AntCheckListItem(value: 'C', disabled: true),
              AntCheckListItem(value: 'D'),
            ],
          ),
        ),
        DemoBlock(
          title: '多选',
          padding: 0,
          child: AntCheckList(
            multiple: true,
            value: _value1,
            onChange: (value) {
              setState(() {
                _value1 = value;
              });
            },
            items: [
              AntCheckListItem(value: 'A'),
              AntCheckListItem(value: 'B'),
              AntCheckListItem(value: 'C'),
            ],
          ),
        ),
        DemoBlock(
          title: '自定义选中图标',
          padding: 0,
          child: AntCheckList(
            activeIcon: const Icon(AntIcons.smileOutline),
            value: _value2,
            onChange: (value) {
              setState(() {
                _value2 = value;
              });
            },
            items: [
              AntCheckListItem(value: 'A'),
              AntCheckListItem(value: 'B'),
              AntCheckListItem(value: 'C'),
            ],
          ),
        ),
      ],
    );
  }
}
