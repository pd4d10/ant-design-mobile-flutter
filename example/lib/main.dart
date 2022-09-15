import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/button.dart';
import 'package:example/icons.dart';
import 'package:example/list.dart';
import 'package:example/nav_bar.dart';
import 'package:example/tab_bar.dart';
import 'package:example/tag.dart';
import 'package:example/toast.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _routes = [
  GoRoute(
    name: 'Button',
    path: '/button',
    builder: (context, state) => const ButtonExample(),
  ),
  GoRoute(
    name: 'Icons',
    path: '/icons',
    builder: (context, state) => const IconsExample(),
  ),
  GoRoute(
    name: 'List',
    path: '/list',
    builder: (context, state) => const ListExample(),
  ),
  GoRoute(
    name: 'NavBar',
    path: '/nav-bar',
    builder: (context, state) => const NavBarExample(),
  ),
  GoRoute(
    name: 'TabBar',
    path: '/tab-bar',
    builder: (context, state) => const TabBarExample(),
  ),
  GoRoute(
    name: 'Tag',
    path: '/tag',
    builder: (context, state) => const TagExample(),
  ),
  GoRoute(
    name: 'Toast',
    path: '/toast',
    builder: (context, state) => const ToastExample(),
  ),
]
    .map(
      (e) => GoRoute(
        name: e.name,
        path: e.path,
        builder: (context, state) => DemoScaffold(
          title: e.name!,
          child: e.builder(context, state),
        ),
      ),
    )
    .toList();

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyHomePage(title: 'Antd Mobile'),
  ),
  ..._routes
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
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
      body: AntList(
        items: [
          for (final route in _routes)
            AntListItem(
              child: Text(route.name!),
              onClick: () {
                context.push(route.path);
              },
            )
        ],
      ),
    );
  }
}
