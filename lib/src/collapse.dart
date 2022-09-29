import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntCollapse extends StatelessWidget {
  const AntCollapse({
    super.key,
    this.accordion = false,
    required this.activeKey,
    required this.onChange,
    required this.panels,
  });

  final bool accordion;
  final List<String> activeKey;
  final void Function(List<String>) onChange;
  final List<AntCollapsePanel> panels;

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);

    return AntList(
      children: [
        for (final panel in panels) ...[
          AntListItem(
            child: panel.title,
            onClick: () {
              if (accordion) {
                onChange([panel.key]);
              } else {
                if (activeKey.contains(panel.key)) {
                  onChange(activeKey..remove(panel.key));
                } else {
                  onChange(activeKey..add(panel.key));
                }
              }
            },
          ),
          if (activeKey.contains(panel.key))
            Container(
              color: theme.colorBackground,
              padding: const EdgeInsets.all(12),
              child: DefaultTextStyle(
                style: TextStyle(
                    color: theme.colorWeak, fontSize: theme.fontSizeMain),
                child: panel.child,
              ),
            ),
        ]
      ],
    );
  }
}

class AntCollapsePanel {
  const AntCollapsePanel({
    required this.key,
    required this.title,
    required this.child,
  });

  final String key;
  final Widget title;
  final Widget child;
}
