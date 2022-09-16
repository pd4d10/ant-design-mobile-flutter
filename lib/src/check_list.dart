import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntCheckList extends StatelessWidget {
  const AntCheckList({
    super.key,
    required this.value,
    required this.items,
    required this.onChange,
    this.multiple = false,
    this.activeIcon = const Icon(AntIcons.checkOutline),
  });

  final List<String> value;
  final List<AntCheckListItem> items;
  final void Function(List<String> value) onChange;
  final bool multiple;
  final Widget activeIcon;

  @override
  Widget build(BuildContext context) {
    return AntList(
      items: [
        for (final item in items)
          AntListItem(
            child: Text(item.value),
            extra: value.contains(item.value)
                ? IconTheme(
                    data: const IconThemeData(
                      size: AntTheme.fontSize8,
                      color: AntTheme.primary,
                    ),
                    child: activeIcon,
                  )
                : null,
            onClick: () {
              final copy = [...value];

              if (multiple) {
                if (copy.contains(item.value)) {
                  copy.remove(item.value);
                } else {
                  copy.add(item.value);
                }
              } else {
                copy.clear();
                copy.add(item.value);
              }

              onChange(copy);
            },
          )
      ],
    );
  }
}

class AntCheckListItem {
  AntCheckListItem({
    this.disabled = false,
    this.readOnly = false,
    required this.value,
  });
  final bool disabled;
  final bool readOnly;
  final String value;
}
