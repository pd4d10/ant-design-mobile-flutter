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
            children: [
              const AntTag(
                fill: AntTagFill.outline,
                child: Text('Default'),
              ),
              AntTag(
                fill: AntTagFill.outline,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Primary'),
              ),
              AntTag(
                fill: AntTagFill.outline,
                color: AntTheme.of(context).colorSuccess,
                child: const Text('Success'),
              ),
              AntTag(
                fill: AntTagFill.outline,
                color: AntTheme.of(context).colorWarning,
                child: const Text('Warning'),
              ),
              AntTag(
                fill: AntTagFill.outline,
                color: AntTheme.of(context).colorDanger,
                child: const Text('Danger'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '语义标签',
          child: Wrap(
            spacing: 8,
            children: [
              const AntTag(child: Text('Default')),
              AntTag(
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Primary'),
              ),
              AntTag(
                color: AntTheme.of(context).colorSuccess,
                child: const Text('Success'),
              ),
              AntTag(
                color: AntTheme.of(context).colorWarning,
                child: const Text('Warning'),
              ),
              AntTag(
                color: AntTheme.of(context).colorDanger,
                child: const Text('Danger'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '圆角标签',
          child: AntTag(
            round: true,
            color: AntTheme.of(context).colorPrimary,
            child: const Text('Round'),
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
        ),
      ],
    );
  }
}
