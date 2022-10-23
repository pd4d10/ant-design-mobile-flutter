import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class CollapseExample extends StatefulWidget {
  const CollapseExample({super.key});

  @override
  State<CollapseExample> createState() => _CollapseExampleState();
}

class _CollapseExampleState extends State<CollapseExample> {
  var _activeKey = {'1'};
  var _activeKey2 = <String>{};

  static final _lorem = lorem();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoBlock(
          title: '基础用法',
          padding: 0,
          child: AntCollapse(
            activeKey: _activeKey,
            onChange: (key) {
              setState(() {
                _activeKey = key;
              });
            },
            panels: [
              AntCollapsePanel(
                key: '1',
                title: const Text('第一项'),
                child: Text(_lorem),
              ),
              AntCollapsePanel(
                key: '2',
                title: const Text('第二项'),
                child: Text(_lorem),
              ),
              AntCollapsePanel(
                key: '3',
                title: const Text('第三项'),
                child: Text(_lorem),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '手风琴模式',
          padding: 0,
          child: AntCollapse(
            accordion: true,
            activeKey: _activeKey2,
            onChange: (key) {
              setState(() {
                _activeKey2 = key;
              });
            },
            panels: const [
              AntCollapsePanel(
                key: '1',
                title: Text('第一项'),
                child: Text('手风琴模式只能同时展开一个'),
              ),
              AntCollapsePanel(
                key: '2',
                title: Text('第二项'),
                child: Text('手风琴模式只能同时展开一个'),
              ),
              AntCollapsePanel(
                key: '3',
                title: Text('第三项'),
                child: Text('手风琴模式只能同时展开一个'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
