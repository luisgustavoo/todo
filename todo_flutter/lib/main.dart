import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_flutter/core/todo_application_bindings.dart';
import 'package:todo_flutter/modules/account/account_module.dart';
import 'package:todo_flutter/modules/auth/auth_module.dart';
import 'package:todo_flutter/modules/splash/splash_module.dart';
import 'package:todo_flutter/modules/todo/todo_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: TodoApplicationBindings(),
      modules: [
        SplashModule(),
        AuthModule(),
        TodoModule(),
        AccountModule(),
      ],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          navigatorObservers: [flutterGetItNavObserver],
          routes: routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
