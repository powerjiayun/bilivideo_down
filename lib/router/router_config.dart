import 'package:bilivideo_down/views/nav/desk_navigate.dart';
import 'package:bilivideo_down/views/nav/download_nav.dart';
import 'package:bilivideo_down/views/pages/search_page.dart';
import 'package:bilivideo_down/views/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterPath {
  static const String search = "/search";

  static const String download = "/download";

  static const String settings = "/setting";

  static final List<String> pagesRoutePaths = [
    search,
    download,
    settings,
  ];

//根据路由获取当前活跃的索引
  static int? activeIndex(String path) {
    int index =
        RouterPath.pagesRoutePaths.indexWhere((menu) => menu.contains(path));
    if (index == -1) return null;
    return index;
  }
}

final GoRouter routerConfig = GoRouter(
  initialLocation: RouterPath.search,
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return DeskNavigation(content: child);
      },
      routes: [
        GoRoute(
          path: RouterPath.search,
          builder: (BuildContext context, GoRouterState state) =>
              const SearchPage(),
        ),
        GoRoute(
          path: RouterPath.download,
          builder: (BuildContext context, GoRouterState state) {
            return const DownloadNavigation();
          },
        ),
        GoRoute(
          path: RouterPath.settings,
          builder: (BuildContext context, GoRouterState state) =>
              const SettingsPage(),
        )
      ],
    ),
  ],
);
