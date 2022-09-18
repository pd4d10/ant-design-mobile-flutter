import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/action_sheet.dart';
import 'package:example/button.dart';
import 'package:example/check_list.dart';
import 'package:example/icons.dart';
import 'package:example/infinite_scroll.dart';
import 'package:example/list.dart';
import 'package:example/nav_bar.dart';
import 'package:example/popup.dart';
import 'package:example/tab_bar.dart';
import 'package:example/tag.dart';
import 'package:example/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _routes = [
  GoRoute(
    name: 'ActionSheet',
    path: '/action-sheet',
    builder: (context, state) => const ActionSheetExample(),
  ),
  GoRoute(
    name: 'Button',
    path: '/button',
    builder: (context, state) => const ButtonExample(),
  ),
  GoRoute(
    name: 'CheckList',
    path: '/check-list',
    builder: (context, state) => const CheckListExample(),
  ),
  GoRoute(
    name: 'Icons',
    path: '/icons',
    builder: (context, state) => const IconsExample(),
  ),
  GoRoute(
    name: 'InfiniteScroll',
    path: '/infinite-scroll',
    builder: (context, state) => const InfiniteScrollExample(),
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
    name: 'Popup',
    path: '/popup',
    builder: (context, state) => const PopupExample(),
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
        builder: (context, state) {
          var child = e.builder(context, state);

          if (e.name != 'InfiniteScroll') {
            child = SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xfffafbfc)),
                // padding: const EdgeInsets.all(8.0),
                child: child,
              ),
            );
          }

          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(e.name!),
            ),
            child: SafeArea(child: child),
          );
        },
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
    return CupertinoApp.router(
      title: 'Flutter Demo',
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: AntList(
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
        ),
      ),
    );
  }
}
