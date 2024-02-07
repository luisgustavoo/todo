import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todo_client/todo_client.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required this.client,
  }) : super(const AppState.initial());

  late SessionManager sessionManager;
  final Client client;

  Future<void> initializeServerpodClient() async {
    sessionManager = SessionManager(
      caller: client.modules.auth,
    );

    // await sessionManager.initialize();
  }

  Future<bool> disconnect() async {
    return sessionManager.signOut();
  }
}
