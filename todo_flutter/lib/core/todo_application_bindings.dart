import 'package:flutter_getit/flutter_getit.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';

class TodoApplicationBindings extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() {
    const ipAddress = 'localhost';

    return [
      Bind.singleton(
        (i) => Client(
          'http://$ipAddress:8080/',
          authenticationKeyManager: FlutterAuthenticationKeyManager(),
        )..connectivityMonitor = FlutterConnectivityMonitor(),
      ),
      Bind.singleton(
        (i) => AppCubit(
          client: i(),
        )..initializeServerpodClient(),
      ),
    ];
  }
}
