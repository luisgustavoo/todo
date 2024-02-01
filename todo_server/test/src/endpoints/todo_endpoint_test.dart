import 'dart:indexed_db';

import 'package:mocktail/mocktail.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:todo_server/src/endpoints/todo_endpoint.dart';
import 'package:todo_server/src/generated/protocol.dart';

class MockTodo extends Mock implements Todo {}

class MockTodoRepository extends Mock implements TodoRepository {}

class MockSession extends Mock implements Session {}


// ignore: avoid_implementing_value_types
class MockDatabase extends Mock implements Database {

}

late TodoEndpoint todoEndpoint;

void main() {
  setUp(() {
    todoEndpoint = TodoEndpoint();
  });

  test('Test', () async {
    final todo = Todo(description: 'Test', isDone: false);

    when(() => Todo.db.insertRow(MockSession(), todo))
        .thenAnswer((_) => Future.value(todo));

    // when(
    //  () =>  MockSession().dbNext,
    
    // ).thenReturn(MockDatabase());

    await todoEndpoint.create(MockSession(), todo);

    verify(
      () => todoEndpoint.create(MockSession(), todo),
    ).called(1);
  });
}
