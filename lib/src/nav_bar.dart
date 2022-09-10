import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntNavBar extends StatelessWidget {
  const AntNavBar({
    super.key,
    this.title,
    this.left,
    this.right,
  });

  /// Title
  final Widget? title;

  /// Content on the left, rendered on the right side of the return area
  final Widget? left;

  ///	The content of the right side	ReactNode	-
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: AntTheme.white,
      ),
      child: Row(
        children: [
          // if (back)
          //   GestureDetector(
          //     onTap: onBack,
          //     child: Container(
          //       width: 45,
          //       height: 45,
          //       child: Row(
          //         children: [
          //           if (backArrow)
          //             Icon(
          //               Icons.arrow_back_ios, // TODO:
          //               size: 20,
          //               color: Colors.black,
          //             ),
          //           left,
          //         ],
          //       ),
          //     ),
          //   ),
          Flexible(
            flex: 0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: AntTheme.fontSize7,
                color: AntTheme.text,
              ),
              child: left ?? const SizedBox.shrink(),
            ),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: AntTheme.fontSize10,
                color: AntTheme.text,
              ),
              child: Center(child: title ?? const SizedBox.shrink()),
            ),
          ),
          Flexible(
            flex: 0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: AntTheme.fontSize7,
                color: AntTheme.text,
              ),
              child: right ?? const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
