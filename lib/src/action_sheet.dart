import 'package:antd_mobile/antd_mobile.dart';
import 'package:antd_mobile/src/_tapable.dart';
import 'package:flutter/widgets.dart';

class AntActionSheetAction<T> {
  const AntActionSheetAction({
    required this.key,
    required this.text,
    this.description,
    this.disabled = false,
    this.onClick,
  });

  final T key;
  final Widget text;
  final Widget? description;
  final bool disabled;
  final VoidCallback? onClick;
}

class AntActionSheetItem<T> extends StatelessWidget {
  const AntActionSheetItem({super.key, required this.action});

  final AntActionSheetAction<T> action;

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);

    return Tapable(
      onTap: () {
        action.onClick?.call();
        Navigator.of(context).pop(action.key);
      },
      builder: (active) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: active ? theme.colorBorder : theme.colorBackground,
          border: Border(
            bottom: BorderSide(width: 1, color: theme.colorBorder),
          ),
        ),
        child: Center(
          child: Opacity(
            opacity: action.disabled ? .4 : 1,
            child: Column(
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: theme.fontSize10,
                    color: theme.colorText,
                  ),
                  child: action.text,
                ),
                if (action.description != null) ...[
                  const SizedBox(height: 4),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: theme.fontSize6,
                      color: theme.colorWeak,
                    ),
                    child: action.description!,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AntActionSheet extends StatelessWidget {
  const AntActionSheet({super.key});

  static Future<T?> show<T>({
    required BuildContext context,
    required List<AntActionSheetAction<T>> actions,
    bool closeOnMaskClick = true,
    Widget? extra,
    Widget? cancelText,
  }) async {
    return AntPopup.show<T>(
      context: context,
      closeOnMaskClick: closeOnMaskClick,
      builder: (context) {
        final theme = AntTheme.of(context);

        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (extra != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorBackground,
                    border: Border(
                      bottom: BorderSide(width: 1, color: theme.colorBorder),
                    ),
                  ),
                  child: Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: theme.colorWeak,
                        fontSize: theme.fontSize7,
                      ),
                      child: extra,
                    ),
                  ),
                ),
              ...[
                for (final e in actions.asMap().entries)
                  AntActionSheetItem(action: e.value),
              ],
              if (cancelText != null) ...[
                Container(color: theme.colorBox, height: 8),
                AntActionSheetItem(
                  action: AntActionSheetAction(text: cancelText, key: null),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
