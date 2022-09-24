import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DemoBlock(
          title: '填充模式',
          child: Wrap(
            spacing: 8,
            children: [
              AntButton(
                color: AntTheme.of(context).colorPrimary,
                fill: AntButtonFill.solid,
                child: const Text('Solid'),
              ),
              AntButton(
                color: AntTheme.of(context).colorPrimary,
                fill: AntButtonFill.outline,
                child: const Text('Outline'),
              ),
              AntButton(
                color: AntTheme.of(context).colorPrimary,
                fill: AntButtonFill.none,
                child: const Text('None'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '块级按钮',
          child: AntButton(
            block: true,
            color: AntTheme.of(context).colorPrimary,
            size: AntButtonSize.large,
            child: const Text('Block Button'),
          ),
        ),
        DemoBlock(
          title: '按钮尺寸',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              AntButton(
                size: AntButtonSize.mini,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Mini'),
              ),
              AntButton(
                size: AntButtonSize.small,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Small'),
              ),
              AntButton(
                size: AntButtonSize.middle,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Middle'),
              ),
              AntButton(
                size: AntButtonSize.large,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Large'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '语义按钮',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const AntButton(child: Text('Default')),
              AntButton(
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Primary'),
              ),
              AntButton(
                color: AntTheme.of(context).colorSuccess,
                child: const Text('Success'),
              ),
              AntButton(
                color: AntTheme.of(context).colorDanger,
                child: const Text('Danger'),
              ),
              AntButton(
                color: AntTheme.of(context).colorWarning,
                child: const Text('Warning'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '形状',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                shape: AntButtonShape.defaults,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Default Button'),
              ),
              AntButton(
                shape: AntButtonShape.rounded,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Rounded Button'),
              ),
              AntButton(
                shape: AntButtonShape.rectangular,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Rectangular Button'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '禁用状态',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const AntButton(
                disabled: true,
                child: Text('Disabled'),
              ),
              AntButton(
                disabled: true,
                color: AntTheme.of(context).colorPrimary,
                child: const Text('Disabled'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
