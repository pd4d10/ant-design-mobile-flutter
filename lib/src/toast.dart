import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

enum AntToastPosition {
  top,
  center,
  bottom,
}

class AntToast {
  static Future<void> show(
    BuildContext context, {
    required Widget content,
    Widget? icon,
    AntToastPosition position = AntToastPosition.center,
    Duration duration = const Duration(seconds: 2),
    bool maskClickable = true,
  }) async {
    final entry = OverlayEntry(
      builder: (context) {
        return Align(
          alignment: Alignment(
              0,
              (position == AntToastPosition.top
                  ? -0.6 // 20%
                  : position == AntToastPosition.bottom
                      ? 0.6 // 80%
                      : 0)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 96,
              maxWidth: 200,
              // maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, .7),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: icon == null
                  ? const EdgeInsets.all(12)
                  : const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: IconTheme(
                        data: const IconThemeData(
                            size: 36, color: AntTheme.white),
                        child: icon,
                      ),
                    ),
                  DefaultTextStyle(
                    style: const TextStyle(
                        color: AntTheme.white, fontSize: AntTheme.fontSize7),
                    child: content,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context)?.insert(entry);

    await Future.delayed(duration);
    entry.remove();
  }
}
