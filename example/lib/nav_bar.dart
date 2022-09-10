import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavBarExample extends StatelessWidget {
  const NavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DemoBlock(
          title: 'Basic',
          padding: 0,
          child: AntNavBar(
            title: Text('Title'),
          ),
        ),
        DemoBlock(
          title: 'Left',
          padding: 0,
          child: AntNavBar(
            left: Icon(Icons.arrow_back_ios),
            title: Text('Title'),
          ),
        ),
        DemoBlock(
          title: 'Right',
          padding: 0,
          child: AntNavBar(
            left: Icon(Icons.arrow_back_ios),
            title: Text('Title'),
            right: Icon(Icons.more_horiz),
          ),
        ),
      ],
    );
  }
}
