import 'package:antd_mobile/antd_mobile.dart';
import 'package:antd_mobile/src/_tapable.dart';
import 'package:flutter/widgets.dart';

class AntListItem extends StatelessWidget {
  const AntListItem({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    if (onClick == null) {
      return _buildItem();
    } else {
      return Tapable(
        onTap: onClick,
        disabled: disabled,
        builder: (active) {
          return _buildItem(active);
        },
      );
    }
  }

  Widget _buildItem([bool? active]) {
    return Opacity(
      opacity: disabled ? .4 : 1,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: AntTheme.fontSize9,
          color: AntTheme.text,
          height: 1.5,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: active == true ? AntTheme.border : null,
          child: Row(
            children: [
              if (prefix != null) ...[
                IconTheme(
                  data: const IconThemeData(
                    color: AntTheme.text,
                    size: 17,
                  ),
                  child: prefix!,
                ),
                const SizedBox(width: 12)
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: AntTheme.fontSize5,
                          color: AntTheme.weak,
                        ),
                        child: title!,
                      ),
                    child,
                    if (description != null)
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: AntTheme.fontSize5,
                          color: AntTheme.weak,
                        ),
                        child: description!,
                      )
                  ],
                ),
              ),
              if (extra != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: AntTheme.fontSize7, color: AntTheme.weak),
                    child: extra!,
                  ),
                ),
              if (onClick != null && arrow != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: IconTheme(
                    data: const IconThemeData(
                      size: 19,
                      color: AntTheme.light,
                    ),
                    child: arrow!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

enum AntListMode {
  defaults,
  card,
}

class AntList extends StatefulWidget {
  const AntList({
    super.key,
    this.header,
    required this.children,
    this.mode = AntListMode.defaults,
  });

  /// The title of list.
  final Widget? header;

  final List<Widget> children;

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
          Container(
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
            child: Column(children: [
              for (final e in widget.children.asMap().entries) ...[
                if (e.key != 0)
                  Row(
                    children: const [
                      SizedBox(width: 12, height: 1),
                      Expanded(
                        child: SizedBox(
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: AntTheme.border),
                          ),
                        ),
                      ),
                    ],
                  ),
                e.value,
              ]
            ]),
          )
        ],
      ),
    );
  }
}
