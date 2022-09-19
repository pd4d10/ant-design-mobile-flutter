import 'package:antd_mobile/antd_mobile.dart';
import 'package:antd_mobile/src/_tapable.dart';
import 'package:flutter/widgets.dart';

class AntListItem {
  AntListItem({
    this.prefix,
    required this.child,
    this.onClick,
    this.extra,
    this.description,
    this.title,
    this.arrow = const Icon(AntIcons.rightOutline),
    this.disabled = false,
  });

  //
  final Widget? prefix;

  final Widget child;

  final VoidCallback? onClick;

  final Widget? extra;

  final Widget? description;

  final Widget? title;

  final Widget? arrow;

  final bool disabled;
}

enum AntListMode {
  defaults,
  card,
}

class AntList extends StatefulWidget {
  const AntList({
    super.key,
    this.header,
    required this.items,
    this.mode = AntListMode.defaults,
  });

  /// The title of list.
  final Widget? header;

  final List<AntListItem> items;

  final AntListMode mode;

  @override
  State<AntList> createState() => _AntListState();
}

class _AntListState extends State<AntList> {
  @override
  Widget build(BuildContext context) {
    final card = widget.mode == AntListMode.card;

    return Padding(
      padding: EdgeInsets.all(card ? 12 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.header != null)
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: AntTheme.fontSize7,
                color: AntTheme.weak,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: card ? 0 : 12, vertical: 8),
                child: widget.header!,
              ),
            ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: AntTheme.fontSize9,
              color: AntTheme.text,
              height: 1.5,
            ),
            child: Container(
              decoration: card
                  ? const BoxDecoration(
                      color: AntTheme.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )
                  : const BoxDecoration(
                      color: AntTheme.white,
                      border: Border.symmetric(
                        horizontal: BorderSide(color: AntTheme.border),
                      ),
                    ),
              child: Column(
                children: [
                  for (final e in widget.items.asMap().entries)
                    if (e.value.onClick == null)
                      _buildItem(e.key, e.value)
                    else
                      Tapable(
                        onTap: e.value.onClick,
                        disabled: e.value.disabled,
                        builder: (active) {
                          return _buildItem(e.key, e.value, active);
                        },
                      ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(int index, AntListItem item, [bool? active]) {
    return Opacity(
      opacity: item.disabled ? .4 : 1,
      child: Container(
        padding: const EdgeInsets.only(left: 12),
        color: active == true ? AntTheme.border : null,
        child: Container(
          decoration: index == 0
              ? null
              : const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AntTheme.border),
                  ),
                ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
            child: Row(
              children: [
                if (item.prefix != null) ...[
                  IconTheme(
                    data: const IconThemeData(
                      color: AntTheme.text,
                      size: 17,
                    ),
                    child: item.prefix!,
                  ),
                  const SizedBox(width: 12)
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.title != null)
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: AntTheme.fontSize5,
                            color: AntTheme.weak,
                          ),
                          child: item.title!,
                        ),
                      item.child,
                      if (item.description != null)
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: AntTheme.fontSize5,
                            color: AntTheme.weak,
                          ),
                          child: item.description!,
                        )
                    ],
                  ),
                ),
                if (item.extra != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: AntTheme.fontSize7, color: AntTheme.weak),
                      child: item.extra!,
                    ),
                  ),
                if (item.onClick != null && item.arrow != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: IconTheme(
                      data: const IconThemeData(
                        size: 19,
                        color: AntTheme.light,
                      ),
                      child: item.arrow!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
