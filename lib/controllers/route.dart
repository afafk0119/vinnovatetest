import 'package:flutter/material.dart';

const String initialRoute = '/';

const String login = '/login';

class Routers {
  static Route<T> generateRoute<T>(RouteSettings settings) {
    final args = settings.arguments;
    var screen;
    switch (settings.name) {
      // case initialRoute:
      //   screen = (_) => const SplashScreen();
      //   break;

      default:
        screen = (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            );
    }
    return _pageRoute(screen);
  }

  static _pageRoute(WidgetBuilder builder) =>
      MaterialPageRoute(builder: builder);
}

class ScreenArguments {
  final String? createaccountdata;

  ScreenArguments({
    this.createaccountdata,
  });
}
