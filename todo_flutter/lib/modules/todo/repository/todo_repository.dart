import 'dart:developer';

import 'package:todo_client/todo_client.dart';

class TodoRepository {
  TodoRepository({
    required Client client,
  }) : _client = client;

  final Client _client;

  Future<void> create(Todo todo) async {
    try {
      await _client.todo.create(todo);
    } on Exception catch (e, s) {
      log('Erro ao create Todo', error: e, stackTrace: s);
    }
  }

  Future<List<Todo>> findAll() async {
    try {
      return _client.todo.findAll();
    } on Exception catch (e, s) {
      log('Erro ao listar Todo', error: e, stackTrace: s);
      throw Exception('Erro ao listar Todo');
    }
  }

  Future<void> update(Todo todo) async {
    try {
      await _client.todo.update(todo);
    } on Exception catch (e, s) {
      log('Erro ao listar Todo', error: e, stackTrace: s);
    }
  }
}
