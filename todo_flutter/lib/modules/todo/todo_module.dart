import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_flutter/modules/todo/cubit/todo_cubit.dart';
import 'package:todo_flutter/modules/todo/pages/create_todo_page.dart';
import 'package:todo_flutter/modules/todo/pages/todo_page.dart';
import 'package:todo_flutter/modules/todo/repository/todo_repository.dart';

class TodoModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton(
        (i) => TodoRepository(
          client: i(),
        ),
      ),
      Bind.lazySingleton(
        (i) => TodoCubit(
          repository: i(),
        )..findAll(),
      ),
    ];
  }

  @override
  String get moduleRouteName => '/todo';

  @override
  Map<String, WidgetBuilder> get pages {
    return {
      '/': (context) => TodoPage(
            moduleRouteName: moduleRouteName,
          ),
      '/create': (context) => const CreateTodoPage(),
    };
  }
}
