import 'package:flutter/widgets.dart';

enum AntPopupPosition {
  bottom,
  top,
  left,
  right,
}

class AntPopup extends StatelessWidget {
  const AntPopup({super.key});

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    AntPopupPosition position = AntPopupPosition.bottom,
    bool closeOnMaskClick = false,
  }) {
    return Navigator.of(context).push(
      AntPopupRoute<T>(
        barrierDismissible: closeOnMaskClick,
        builder: builder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AntPopupRoute<T> extends RawDialogRoute<T> {
  AntPopupRoute({
    required this.builder,
    super.barrierDismissible,
    super.transitionDuration = const Duration(milliseconds: 250),
    super.transitionBuilder = _buildTransitions,
  }) : super(
          pageBuilder: (context, animation,
              secondaryAnimation) {
            return builder(context);
          },
          barrierLabel: 'Dismiss',
          barrierColor: const Color.fromRGBO(0, 0, 0, .55),
        );

  final WidgetBuilder builder;
}

Widget _buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
// TODO:
  return Align(alignment: Alignment.bottomCenter, child: child);
}
