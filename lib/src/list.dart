import 'package:antd_mobile/antd_mobile.dart';
import 'package:antd_mobile/src/_tapable.dart';
import 'package:flutter/widgets.dart';

// TODO: private
class AntListBorder extends StatelessWidget {
  const AntListBorder({this.hasLeftPadding = false});
  final bool hasLeftPadding;

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);

    return Row(
      children: [
        SizedBox(width: hasLeftPadding ? 12 : 0, height: 1),
        Expanded(
          child: SizedBox(
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(color: theme.colorBorder),
            ),
          ),
        ),
      ],
    );
  }
}

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
      return _buildItem(context);
    } else {
      return Tapable(
        onTap: onClick,
        disabled: disabled,
        builder: (active) {
          return _buildItem(context, active);
        },
      );
    }
  }

  Widget _buildItem(BuildContext context, [bool? active]) {
    final theme = AntTheme.of(context);

    return Opacity(
      opacity: disabled ? .4 : 1,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: theme.fontSize9,
          color: theme.colorText,
          height: 1.5,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: active == true ? theme.colorBorder : null,
          child: Row(
            children: [
              if (prefix != null) ...[
                IconTheme(
                  data: IconThemeData(
                    color: theme.colorText,
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
                        style: TextStyle(
                          fontSize: theme.fontSize5,
                          color: theme.colorWeak,
                        ),
                        child: title!,
                      ),
                    child,
                    if (description != null)
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: theme.fontSize5,
                          color: theme.colorWeak,
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
                    style: TextStyle(
                        fontSize: theme.fontSize7, color: theme.colorWeak),
                    child: extra!,
                  ),
                ),
              if (onClick != null && arrow != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: IconTheme(
                    data: IconThemeData(
                      size: 19,
                      color: theme.colorLight,
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
    final theme = AntTheme.of(context);

    return Padding(
      padding: EdgeInsets.all(card ? 12 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.header != null)
            DefaultTextStyle(
              style: TextStyle(
                fontSize: theme.fontSize7,
                color: theme.colorWeak,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: card ? 0 : 12, vertical: 8),
                child: widget.header!,
              ),
            ),
          Container(
            decoration: card
                ? BoxDecoration(
                    color: theme.colorBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  )
                : BoxDecoration(
                    color: theme.colorBackground,
                    border: Border.symmetric(
                      horizontal: BorderSide(color: theme.colorBorder),
                    ),
                  ),
            child: Column(
              children: [
                for (final e in widget.children.asMap().entries) ...[
                  if (e.key != 0) const AntListBorder(hasLeftPadding: true),
                  e.value,
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AntSliverList extends StatelessWidget {
  const AntSliverList({
    super.key,
    required this.count,
    required this.itemBuilder,
  });

  final int count;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index % 2 == 0) {
            return AntListBorder(
              hasLeftPadding: index > 0 && index < 2 * count,
            );
          } else {
            return itemBuilder(context, index ~/ 2);
          }
        },
        childCount: 2 * count + 1,
      ),
    );
  }
}
