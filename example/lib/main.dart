import 'package:antd_mobile/antd_mobile.dart';
import 'package:example/action_sheet.dart';
import 'package:example/button.dart';
import 'package:example/check_list.dart';
import 'package:example/collapse.dart';
import 'package:example/icons.dart';
import 'package:example/infinite_scroll.dart';
import 'package:example/input.dart';
import 'package:example/list.dart';
import 'package:example/nav_bar.dart';
import 'package:example/popup.dart';
import 'package:example/swipe_action.dart';
import 'package:example/tab_bar.dart';
import 'package:example/tag.dart';
import 'package:example/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
    name: 'Collapse',
    path: '/collapse',
    builder: (context, state) => const CollapseExample(),
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
    name: 'Input',
    path: '/input',
    builder: (context, state) => const InputExample(),
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
    name: 'SwipeAction',
    path: '/swipe-action',
    builder: (context, state) => const SwipeActionExample(),
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
            child = SingleChildScrollView(child: child);
          }

          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(e.name!),
              trailing: const ToggleButton(),
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

class ThemeModel extends ChangeNotifier {
  var brightness = Brightness.light;

  void toggleBrightness() {
    brightness =
        brightness == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}

final themeProvider = StateProvider((_) => Brightness.light);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final brightness = ref.watch(themeProvider);

    return AntTheme(
      data: AntThemeData(brightness: brightness),
      child: Builder(
        builder: (context) {
          return CupertinoApp.router(
            theme: CupertinoThemeData(
              brightness: brightness,
              scaffoldBackgroundColor: AntTheme.of(context).colorBox,
            ),
            title: 'Flutter Demo',
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
          );
        },
      ),
    );
  }
}

class ToggleButton extends ConsumerWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      child: const Icon(CupertinoIcons.brightness),
      onTap: () {
        ref.read(themeProvider.notifier).update(
              (state) => state == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
            );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        trailing: const ToggleButton(),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: AntList(
            children: [
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
