import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class PopupExample extends StatelessWidget {
  const PopupExample({super.key});

  @override
  Widget build(BuildContext context) {
    final loremWidget = Container(
      color: AntTheme.of(context).colorBackground,
      padding: const EdgeInsets.all(20),
      child: Text(lorem()),
    );

    return Column(
      children: [
        DemoBlock(
          title: '弹出位置',
          child: Wrap(
            direction: Axis.vertical,
            spacing: 8,
            children: [
              AntButton(
                onClick: () {
                  AntPopup.show(
                    context: context,
                    builder: (_) => loremWidget,
                    closeOnMaskClick: true,
                  );
                },
                child: const Text('底部弹出'),
              ),
              AntButton(
                child: const Text('顶部弹出'),
                onClick: () {
                  AntPopup.show(
                    context: context,
                    builder: (_) => loremWidget,
                    closeOnMaskClick: true,
                    position: AntPopupPosition.top,
                  );
                },
              ),
              AntButton(
                child: const Text('左侧弹出'),
                onClick: () {
                  AntPopup.show(
                    context: context,
                    builder: (_) => loremWidget,
                    closeOnMaskClick: true,
                    position: AntPopupPosition.left,
                  );
                },
              ),
              AntButton(
                child: const Text('右侧弹出'),
                onClick: () {
                  AntPopup.show(
                    context: context,
                    builder: (_) => loremWidget,
                    closeOnMaskClick: true,
                    position: AntPopupPosition.right,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
