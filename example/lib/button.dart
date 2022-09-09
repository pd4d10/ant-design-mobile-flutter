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
          title: 'Fill',
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
          title: 'Block',
          child: AntButton(
            block: true,
            color: AntTheme.primary,
            size: AntButtonSize.large,
            child: Text('Block Button'),
          ),
        ),
        DemoBlock(
          title: 'Size',
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
          title: 'Color',
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
      ],
    );
  }
}
