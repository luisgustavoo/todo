import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_flutter/modules/splash/splash_page.dart';

class SplashModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages {
    return {
      '/': (context) => const SplashPage(),
    };
  }
}
