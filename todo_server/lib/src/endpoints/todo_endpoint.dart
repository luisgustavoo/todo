import 'package:serverpod/serverpod.dart';
import 'package:todo_server/src/generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<void> create(Session session, Todo todo) async {
    try {
      final logged = await session.isUserSignedIn;
      if (logged) {
        await Todo.db.insertRow(session, todo);
      }
    } on Exception catch (e, s) {
      session.log(
        '$e ${session.server.runMode}',
        exception: e,
        level: LogLevel.error,
        stackTrace: s,
      );
      throw CustomException(
        message: 'Erro ao criar tarefa $e',
        errorType: ErrorTypeEnum.insert,
      );
    }
  }

  Future<List<Todo>> findAll(Session session) {
    try {
      return Todo.db.find(
        session,
        orderByList: (todo) {
          return [
            Order(
              column: todo.isDone,
            ),
            Order(
              column: todo.description,
            ),
          ];
        },
      );
    } on Exception catch (e) {
      throw CustomException(
        message: 'Erro ao buscar todas as tarefas $e',
        errorType: ErrorTypeEnum.select,
      );
    }
  }

  Future<Todo> update(Session session, Todo todo) {
    try {
      return Todo.db.updateRow(session, todo);
    } on Exception catch (e) {
      throw CustomException(
        message: 'Erro ao atualizar tarefas $e',
        errorType: ErrorTypeEnum.update,
      );
    }
  }
}
