import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_flutter/modules/auth/cubit/auth_cubit.dart';
import 'package:todo_flutter/modules/auth/pages/auth_page.dart';

class AuthModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton(
        (i) => AuthCubit(),
      ),
    ];
  }

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages {
    return {
      '/': (context) => const AuthPage(),
    };
  }
}
