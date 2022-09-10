import 'package:example/icons_data.dart';
import 'package:flutter/widgets.dart';

class IconsExample extends StatelessWidget {
  const IconsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final data in iconsData.entries)
          Column(
            children: [
              Icon(
                IconData(
                  data.value,
                  fontFamily: "AntDesignMobile",
                  fontPackage: "antd_mobile",
                ),
              ),
              Text(data.key),
            ],
          )
      ],
    );
  }
}
