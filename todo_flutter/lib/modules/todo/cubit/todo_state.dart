// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

enum TodoStatus {
  initial,
  loading,
}

class TodoState extends Equatable {
  const TodoState._({
    required this.status,
    required this.todoList,
  });

  TodoState.initial()
      : this._(
          status: TodoStatus.initial,
          todoList: [],
        );

  final TodoStatus status;

  final List<Todo> todoList;

  @override
  List<Object?> get props => [
        status,
        todoList,
      ];

  TodoState copyWith({
    TodoStatus? status,
    List<Todo>? todoList,
  }) {
    return TodoState._(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
    );
  }
}
