import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todo_flutter/cubit/app_cubit.dart';
import 'package:todo_flutter/modules/todo/cubit/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({
    required this.moduleRouteName,
    super.key,
  });

  final String moduleRouteName;

  @override
  Widget build(BuildContext context) {
    final sessionManager = context.get<AppCubit>().sessionManager;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        actions: [
          if (sessionManager.isSignedIn)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
                child: CircularUserImage(
                  userInfo: sessionManager.signedInUser,
                  size: 30,
                ),
              ),
            ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        bloc: context.get<TodoCubit>(),
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todoList.length,
            itemBuilder: (context, index) {
              final todo = state.todoList[index];
              return ListTile(
                title: Text(todo.description),
                selected: todo.isDone,
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) async {
                    if (value != null) {
                      debugPrint('check $value');

                      await context.get<TodoCubit>().update(
                            todo.copyWith(
                              isDone: value,
                            ),
                          );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todoCubit = context.get<TodoCubit>();
          final created =
              await Navigator.pushNamed(context, '$moduleRouteName/create')
                  as bool?;
          if (created ?? false) {
            await todoCubit.findAll();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
