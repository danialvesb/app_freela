import 'package:app_freela/main.dart';
import 'package:app_freela/ui/screens/account/account_screen.dart';
import 'package:app_freela/ui/screens/dashboard/dashboard_screen.dart';
import 'package:app_freela/ui/screens/orders/orders_screen.dart';
import 'package:app_freela/ui/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/screens/home/home_screen.dart';
import '../ui/screens/splash/splash_screen.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  static String orders = '/orders';
  static String account = '/account';
  static String search = '/search';
  static String settings = '/settings';
}

/// Routing table, matches string paths to UI Screens
final appRouter = GoRouter(
  redirect: _handleRedirect,
  routes: [
    AppRoute(ScreenPaths.splash, (_) => const SplashScreen()), // This will be hidden
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(
          child: child,
        );
      },
      routes: [
        AppRoute(
          ScreenPaths.home,
          (_) => const DashboardScreen(),
        ),
        AppRoute(
          ScreenPaths.search,
          (_) => const SearchScreen(),
        ),
        AppRoute(
          ScreenPaths.orders,
          (_) => const OrdersScreen(),
        ),
        AppRoute(
          ScreenPaths.account,
          (_) => const AccountScreen(),
        )
      ],
    ),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<RouteBase> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            }
            return MaterialPage(child: pageContent);
          },
        );
  final bool useFade;
}

String? _handleRedirect(BuildContext ctx, GoRouterState state) {
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (!appLogic.isBootstrapComplete && state.location != ScreenPaths.splash) {
    return ScreenPaths.splash;
  }
  return null; // do nothing
}
