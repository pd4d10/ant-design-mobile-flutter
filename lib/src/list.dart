import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntListItem {
  AntListItem({
    this.prefix,
    required this.child,
    this.onClick,
    this.extra,
    this.description,
    this.title,
  });

  //
  final Widget? prefix;

  final Widget child;

  final VoidCallback? onClick;

  final Widget? extra;

  final Widget? description;

  final Widget? title;
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
  final Map<int, bool> _activeMap = {};

  _setActive(AntListItem item, bool active) {
    if (item.onClick == null) return;
    setState(() {
      if (active) {
        _activeMap[widget.items.indexOf(item)] = true;
      } else {
        _activeMap.remove(widget.items.indexOf(item));
      }
    });
  }

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
                for (final item in widget.items)
                  GestureDetector(
                    onTap: () {
                      _setActive(item, false);
                    },
                    onTapDown: (details) {
                      _setActive(item, true);
                    },
                    onTapCancel: () {
                      _setActive(item, false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: _activeMap[widget.items.indexOf(item)] == true
                          ? AntTheme.border
                          : null,
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          if (item.prefix != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: item.prefix!,
                            ),
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
                                    fontSize: AntTheme.fontSize7,
                                    color: AntTheme.weak),
                                child: item.extra!,
                              ),
                            ),
                          if (item.onClick != null)
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(AntIcons.rightOutline,
                                  size: 19, color: AntTheme.light),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
