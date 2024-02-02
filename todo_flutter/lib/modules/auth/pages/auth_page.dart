import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';
import 'package:todo_flutter/modules/todo/cubit/todo_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();

    final isLogged = context.read<AppCubit>().sessionManager.isSignedIn;

    if (isLogged) {
      Navigator.pushReplacementNamed(context, '/todo');
    }
  }

  @override
  Widget build(BuildContext context) {
    final client = context.read<AppCubit>().client;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInWithEmailButton(
              caller: client.modules.auth,
              onSignedIn: () {
                Navigator.pushReplacementNamed(context, '/todo');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // context.read<TodoCubit>().create(
                //       Todo(
                //         description: 'Teste',
                //         isDone: false,
                //       ),
                //     );
              },
              child: const Text('Criar Todo sem login'),
            ),
          ],
        ),
      ),
    );
  }
}
