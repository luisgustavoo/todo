import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';
import 'package:todo_flutter/modules/account/pages/account_page.dart';
import 'package:todo_flutter/modules/auth/cubit/auth_cubit.dart';
import 'package:todo_flutter/modules/auth/pages/auth_page.dart';
import 'package:todo_flutter/modules/todo/cubit/todo_cubit.dart';
import 'package:todo_flutter/modules/todo/pages/create_todo_page.dart';
import 'package:todo_flutter/modules/todo/pages/todo_page.dart';
import 'package:todo_flutter/modules/todo/repository/todo_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit()..initializeServerpodClient(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthPage(),
          '/account': (context) => const AccountPage(),
          '/todo': (context) {
            return RepositoryProvider<TodoRepository>(
              create: (context) {
                return TodoRepository(
                  client: context.read<AppCubit>().client,
                );
              },
              child: BlocProvider<TodoCubit>(
                create: (context) => TodoCubit(
                  repository: context.read<TodoRepository>(),
                )..findAll(),
                child: const TodoPage(),
              ),
            );
          },
          '/create-todo': (context) {
            return RepositoryProvider<TodoRepository>(
              create: (context) => TodoRepository(
                client: context.read<AppCubit>().client,
              ),
              child: BlocProvider<TodoCubit>(
                create: (context) {
                  return TodoCubit(
                    repository: context.read<TodoRepository>(),
                  );
                },
                child: const CreateTodoPage(),
              ),
            );
          },
        },
      ),
    );
  }
}
