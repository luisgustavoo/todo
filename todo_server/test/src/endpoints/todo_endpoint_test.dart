import 'package:mocktail/mocktail.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod/src/database/database_connection.dart';
import 'package:serverpod/src/server/session.dart';
import 'package:test/test.dart';
import 'package:todo_server/src/endpoints/todo_endpoint.dart';
import 'package:todo_server/src/generated/protocol.dart';

class _MockTodoRepository extends Mock implements TodoRepository {
  _MockTodoRepository({
    required this.todoList,
  });

  final List<Todo> todoList;

  @override
  Future<int> count(
    Session session, {
    WhereExpressionBuilder<TodoTable>? where,
    int? limit,
    Transaction? transaction,
  }) {
    return Future.value(todoList.length);
  }

  @override
  Future<List<int>> delete(
    Session session,
    List<Todo> rows, {
    Transaction? transaction,
  }) {
    for (final row in rows) {
      todoList.removeWhere((element) => element.id == row.id);
    }

    return Future.value(todoList.map<int>((e) => e.id!).toList());
  }

  @override
  Future<int> deleteRow(Session session, Todo row, {Transaction? transaction}) {
    todoList.removeWhere((element) => element.id == row.id);

    return Future.value(row.id);
  }

  @override
  Future<List<int>> deleteWhere(
    Session session, {
    required WhereExpressionBuilder<TodoTable> where,
    Transaction? transaction,
  }) {
    Todo.db.deleteWhere(
      session,
      where: (t) {
        return t.id.equals(1) as Expression<int>;
      },
    );

    // where(Todo.t).columns.map((e) => e.table.id == );

    return Future.value(todoList.map<int>((e) => e.id!).toList());
  }

  @override
  Future<List<Todo>> find(
    Session session, {
    WhereExpressionBuilder<TodoTable>? where,
    int? limit,
    int? offset,
    OrderByBuilder<TodoTable>? orderBy,
    bool orderDescending = false,
    OrderByListBuilder<TodoTable>? orderByList,
    Transaction? transaction,
  }) {
    return Future.value(
      [
        Todo(
          description: 'Description',
          isDone: false,
        ),
      ],
    );
  }

  @override
  Future<Todo?> findById(Session session, int id, {Transaction? transaction}) {
    return Future.value(todoList.firstWhere((element) => element.id == id));
  }

  @override
  Future<Todo?> findFirstRow(
    Session session, {
    WhereExpressionBuilder<TodoTable>? where,
    int? offset,
    OrderByBuilder<TodoTable>? orderBy,
    bool orderDescending = false,
    OrderByListBuilder<TodoTable>? orderByList,
    Transaction? transaction,
  }) {
    return Future.value(todoList.firstWhere((element) => element.id == 1));
  }

  @override
  Future<List<Todo>> insert(
    Session session,
    List<Todo> rows, {
    Transaction? transaction,
  }) {
    return Future.value(todoList);
  }

  @override
  Future<Todo> insertRow(
    Session session,
    Todo row, {
    Transaction? transaction,
  }) {
    return Future.value(todoList.firstWhere((element) => element.id == 1));
  }

  @override
  Future<List<Todo>> update(
    Session session,
    List<Todo> rows, {
    ColumnSelections<TodoTable>? columns,
    Transaction? transaction,
  }) {
    return Future.value(todoList);
  }

  @override
  Future<Todo> updateRow(
    Session session,
    Todo row, {
    ColumnSelections<TodoTable>? columns,
    Transaction? transaction,
  }) {
    return Future.value(
      todoList.firstWhere(
        (element) => element.id == 1,
      ),
    );
  }
}

class _MockSession extends Mock implements Session {}

class _MockTodo extends Mock implements Todo {
  _MockTodo({
    required this.todoList,
  });

  final List<Todo> todoList;

  _MockTodoRepository get db => _MockTodoRepository(todoList: todoList);
}

void main() {
  late TodoEndpoint todoEndpoint;
  late _MockTodo mockTodo;
  // late _MockTodo mockTodo;

  final todoList = [
    Todo(
      id: 1,
      description: 'Description',
      isDone: false,
    ),
    Todo(
      id: 2,
      description: 'Description 2',
      isDone: false,
    ),
    Todo(
      id: 3,
      description: 'Description 3',
      isDone: false,
    ),
  ];

  setUp(() {
    mockTodo = _MockTodo(todoList: todoList);
    todoEndpoint = TodoEndpoint();
  });

  test('test name', () async {
    when(() => mockTodo.db).thenReturn(
      _MockTodoRepository(todoList: todoList),
    );

    await todoEndpoint.create(
      _MockSession(),
      Todo(
        id: 1,
        description: 'Description',
        isDone: false,
      ),
    );

    // verify(
    //   () => Todo.db.insertRow(
    //     _MockSession(),
    //     Todo(
    //       id: 1,
    //       description: 'Description',
    //       isDone: false,
    //     ),
    //   ),
    // ).called(1);
  });
}
