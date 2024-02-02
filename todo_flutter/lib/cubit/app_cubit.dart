import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_client/todo_client.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  late SessionManager sessionManager;
  late Client client;

  Future<void> initializeServerpodClient() async {
    const ipAddress = 'localhost';

    client = Client(
      'http://$ipAddress:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    sessionManager = SessionManager(
      caller: client.modules.auth,
    );

    await sessionManager.initialize();
  }

  Future<bool> disconnect() async {
    return sessionManager.signOut();
  }
}
