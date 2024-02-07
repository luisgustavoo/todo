import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final client = context.get<AppCubit>().client;
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
                //context.get<TodoCubit>().create(
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
