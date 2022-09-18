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
            children: const [
              AntButton(
                color: AntTheme.primary,
                fill: AntButtonFill.solid,
                child: Text('Solid'),
              ),
              AntButton(
                color: AntTheme.primary,
                fill: AntButtonFill.outline,
                child: Text('Outline'),
              ),
              AntButton(
                color: AntTheme.primary,
                fill: AntButtonFill.none,
                child: Text('None'),
              ),
            ],
          ),
        ),
        const DemoBlock(
          title: '块级按钮',
          child: AntButton(
            block: true,
            color: AntTheme.primary,
            size: AntButtonSize.large,
            child: Text('Block Button'),
          ),
        ),
        DemoBlock(
          title: '按钮尺寸',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: const [
              AntButton(
                size: AntButtonSize.mini,
                color: AntTheme.primary,
                child: Text('Mini'),
              ),
              AntButton(
                size: AntButtonSize.small,
                color: AntTheme.primary,
                child: Text('Small'),
              ),
              AntButton(
                size: AntButtonSize.middle,
                color: AntTheme.primary,
                child: Text('Middle'),
              ),
              AntButton(
                size: AntButtonSize.large,
                color: AntTheme.primary,
                child: Text('Large'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '语义按钮',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              AntButton(child: Text('Default')),
              AntButton(color: AntTheme.primary, child: Text('Primary')),
              AntButton(color: AntTheme.success, child: Text('Success')),
              AntButton(color: AntTheme.danger, child: Text('Danger')),
              AntButton(color: AntTheme.warning, child: Text('Warning')),
            ],
          ),
        ),
        DemoBlock(
          title: '形状',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              AntButton(
                shape: AntButtonShape.defaultValue,
                color: AntTheme.primary,
                child: Text('Default Button'),
              ),
              AntButton(
                shape: AntButtonShape.rounded,
                color: AntTheme.primary,
                child: Text('Rounded Button'),
              ),
              AntButton(
                shape: AntButtonShape.rectangular,
                color: AntTheme.primary,
                child: Text('Rectangular Button'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: '禁用状态',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              AntButton(
                disabled: true,
                child: Text('Disabled'),
              ),
              AntButton(
                disabled: true,
                color: AntTheme.primary,
                child: Text('Disabled'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
