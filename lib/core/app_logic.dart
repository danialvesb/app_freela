import 'package:app_freela/core/router.dart';

class AppLogic {
  /// Indicates to the rest of the app that bootstrap has not completed.
  /// The router will use this to prevent redirects while bootstrapping.
  bool isBootstrapComplete = false;

  /// Initialize the app and all main actors.
  /// Loads settings, sets up services etc.
  Future<void> bootstrap() async {
    // Flag bootStrap as complete
    isBootstrapComplete = true;

    appRouter.go(ScreenPaths.home);
  }
}
