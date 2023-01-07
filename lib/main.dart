import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/app_logic.dart';
import 'core/router.dart';
import 'ui/app_scaffold.dart';

void main() async {
  // Start app
  registerSingletons();
  await appLogic.bootstrap();
  runApp(const AppFreela());
}

class AppFreela extends StatelessWidget {
  const AppFreela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (__, child) => AppFreelaScaffold(child: child),
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
    );
  }
}

/// Create singletons (controllers and services) that can be shared across the app.
void registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
}

/// Add syntax sugar for quickly accessing the main logical controllers in the app
/// We deliberately do not create shortcuts for services, to discourage their use directly in the view/widget layer.
AppLogic get appLogic => GetIt.I.get<AppLogic>();
