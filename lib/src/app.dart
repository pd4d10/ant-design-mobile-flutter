import 'package:flutter/widgets.dart';

class AntApp extends StatelessWidget {
  const AntApp({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        // keep consistent with CSS behavior?
        leadingDistribution: TextLeadingDistribution.even,
      ),
      child: child,
    );
  }
}
