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
  });

  //
  final Widget? prefix;

  final Widget child;

  final VoidCallback? onClick;

  final Widget? extra;

  final Widget? description;

  final Widget? title;

  final Widget? arrow;
}

class AntList extends StatefulWidget {
  const AntList({
    super.key,
    this.header,
    required this.items,
  });

  /// The title of list.
  final Widget? header;

  final List<AntListItem> items;

  @override
  State<AntList> createState() => _AntListState();
}

class _AntListState extends State<AntList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.header != null)
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: AntTheme.fontSize7,
              color: AntTheme.weak,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            decoration: const BoxDecoration(
              color: AntTheme.white,
              border: Border.symmetric(
                horizontal: BorderSide(color: AntTheme.border),
              ),
            ),
            child: Column(
              children: [
                for (final e in widget.items.asMap().entries)
                  Tapable(
                    onTap: e.value.onClick,
                    builder: (active) {
                      return Container(
                        padding: const EdgeInsets.only(left: 12),
                        color: active ? AntTheme.border : null,
                        child: Container(
                          decoration: e.key == 0
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
                                if (e.value.prefix != null) ...[
                                  IconTheme(
                                    data: const IconThemeData(
                                      color: AntTheme.text,
                                      size: 17,
                                    ),
                                    child: e.value.prefix!,
                                  ),
                                  const SizedBox(width: 12)
                                ],
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (e.value.title != null)
                                        DefaultTextStyle(
                                          style: const TextStyle(
                                            fontSize: AntTheme.fontSize5,
                                            color: AntTheme.weak,
                                          ),
                                          child: e.value.title!,
                                        ),
                                      e.value.child,
                                      if (e.value.description != null)
                                        DefaultTextStyle(
                                          style: const TextStyle(
                                            fontSize: AntTheme.fontSize5,
                                            color: AntTheme.weak,
                                          ),
                                          child: e.value.description!,
                                        )
                                    ],
                                  ),
                                ),
                                if (e.value.extra != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                          fontSize: AntTheme.fontSize7,
                                          color: AntTheme.weak),
                                      child: e.value.extra!,
                                    ),
                                  ),
                                if (e.value.onClick != null &&
                                    e.value.arrow != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: IconTheme(
                                      data: const IconThemeData(
                                        size: 19,
                                        color: AntTheme.light,
                                      ),
                                      child: e.value.arrow!,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
