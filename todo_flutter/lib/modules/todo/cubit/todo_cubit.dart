import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/modules/todo/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({
    required TodoRepository repository,
  })  : _repository = repository,
        super(TodoState.initial());

  final TodoRepository _repository;

  Future<void> create(Todo todo) async {
    try {
      await _repository.create(todo);
    } on Exception catch (e, s) {
      log('Erro ao criar Todos', error: e, stackTrace: s);
    }
  }

  Future<void> findAll() async {
    try {
      final todoList = await _repository.findAll();
      emit(
        state.copyWith(
          todoList: todoList,
        ),
      );
    } on Exception catch (e, s) {
      log('Erro ao listar Todos', error: e, stackTrace: s);
    }
  }

  Future<void> update(Todo todo) async {
    try {
      state.todoList.firstWhere((element) => element == todo).isDone =
          todo.isDone;

      await _repository.update(todo);

      emit(
        state.copyWith(
          todoList: [...state.todoList],
        ),
      );
    } on Exception catch (e, s) {
      log('Erro ao atualizar Todo', error: e, stackTrace: s);
    }
  }
}
