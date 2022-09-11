import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class TagExample extends StatelessWidget {
  const TagExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DemoBlock(
          title: '基础用法',
          child: AntTag(child: Text('123')),
        ),
        DemoBlock(
          title: '线框标签',
          child: Wrap(
            spacing: 8,
            children: const [
              AntTag(
                outline: true,
                color: AntTheme.primary,
                child: Text('Primary'),
              ),
              AntTag(
                outline: true,
                color: Color(0xff87d068),
                child: Text('87d068'),
              ),
              AntTag(
                outline: true,
                color: Color(0xffff6430),
                child: Text('ff6430'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '语义标签',
          child: Wrap(
            spacing: 8,
            children: const [
              AntTag(child: Text('Default')),
              AntTag(color: AntTheme.primary, child: Text('Primary')),
              AntTag(color: AntTheme.success, child: Text('Success')),
              AntTag(color: AntTheme.warning, child: Text('Warning')),
              AntTag(color: AntTheme.danger, child: Text('Danger')),
            ],
          ),
        ),
        DemoBlock(
          title: '自定义颜色',
          child: Wrap(
            spacing: 8,
            children: const [
              AntTag(color: Color(0xff2db7f5), child: Text('2db7f5')),
              AntTag(color: Color(0xff87d068), child: Text('87d068')),
              AntTag(color: Color(0xff108ee9), child: Text('108ee9')),
            ],
          ),
        )
      ],
    );
  }
}
