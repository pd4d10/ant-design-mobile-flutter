import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:antd_mobile/antd_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DemoBlock(
              title: 'Fill',
              child: Wrap(
                spacing: 8,
                children: const [
                  AntButton(
                    color: AntTheme.primary,
                    fill: AntButtonFill.solid,
                    child: Text('Solid'),
                  ),
                  AntButton(
                    color: AntTheme.primary,
                    fill: AntButtonFill.outline,
                    child: Text('Outline'),
                  ),
                  AntButton(
                    color: AntTheme.primary,
                    fill: AntButtonFill.none,
                    child: Text('None'),
                  ),
                ],
              ),
            ),
            const DemoBlock(
              title: 'Block',
              child: AntButton(
                block: true,
                color: AntTheme.primary,
                size: AntButtonSize.large,
                child: Text('Block Button'),
              ),
            ),
            DemoBlock(
              title: 'Size',
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: const [
                  AntButton(
                    size: AntButtonSize.mini,
                    color: AntTheme.primary,
                    child: Text('Mini'),
                  ),
                  AntButton(
                    size: AntButtonSize.small,
                    color: AntTheme.primary,
                    child: Text('Small'),
                  ),
                  AntButton(
                    size: AntButtonSize.middle,
                    color: AntTheme.primary,
                    child: Text('Middle'),
                  ),
                  AntButton(
                    size: AntButtonSize.large,
                    color: AntTheme.primary,
                    child: Text('Large'),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: 'Color',
              child: Wrap(
                spacing: 8,
                children: const [
                  AntButton(child: Text('Default')),
                  AntButton(color: AntTheme.primary, child: Text('Primary')),
                  AntButton(color: AntTheme.success, child: Text('Success')),
                  AntButton(color: AntTheme.danger, child: Text('Danger')),
                  AntButton(color: AntTheme.warning, child: Text('Warning')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
