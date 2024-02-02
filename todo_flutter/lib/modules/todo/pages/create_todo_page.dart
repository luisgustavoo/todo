import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/modules/todo/cubit/todo_cubit.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value == null) {
                    return 'informe a descrição';
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final nav = Navigator.of(context);

                final isValid = _formKey.currentState?.validate() ?? false;
                if (isValid) {
                  final todo = Todo(
                    description: _controller.text,
                    isDone: false,
                  );
                  try {
                    await context.read<TodoCubit>().create(todo);
                    nav.pop(true);
                  } on Exception catch (e, s) {
                    log(
                      'Erro ao criar Todo',
                      error: e,
                      stackTrace: s,
                    );
                  }
                }
              },
              child: const Text('Criara'),
            ),
          ],
        ),
      ),
    );
  }
}
