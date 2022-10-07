import 'package:flutter/widgets.dart';

class AntSwipeActionAction<T> {
  AntSwipeActionAction({
    required this.key,
    this.onClick,
    required this.text,
  });

  ValueKey<T> key;
  void Function()? onClick;
  Widget text;
}

class AntSwipeAction extends StatelessWidget {
  const AntSwipeAction({
    super.key,
    required this.child,
    this.closeOnAction = true,
    this.closeOnTouchOutside = true,
    this.leftActions = const [],
    this.rightActions = const [],
  });

  final Widget child;
  final bool closeOnAction;
  final bool closeOnTouchOutside;
  final List<AntSwipeActionAction> leftActions;
  final List<AntSwipeActionAction> rightActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
