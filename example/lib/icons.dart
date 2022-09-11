import 'package:example/icons_data.dart';
import 'package:flutter/widgets.dart';

class IconsExample extends StatelessWidget {
  const IconsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final data in iconsData.entries)
          Container(
            width: 100,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Icon(
                  IconData(
                    data.value,
                    fontFamily: "AntDesignMobile",
                    fontPackage: "antd_mobile",
                  ),
                  size: 36,
                ),
                const SizedBox(height: 4),
                Text(
                  data.key,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
      ],
    );
  }
}
