/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Todo extends _i1.SerializableEntity {
  Todo._({
    this.id,
    required this.description,
    required this.isDone,
  });

  factory Todo({
    int? id,
    required String description,
    required bool isDone,
  }) = _TodoImpl;

  factory Todo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Todo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      isDone:
          serializationManager.deserialize<bool>(jsonSerialization['isDone']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String description;

  bool isDone;

  Todo copyWith({
    int? id,
    String? description,
    bool? isDone,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'description': description,
      'isDone': isDone,
    };
  }
}

class _Undefined {}

class _TodoImpl extends Todo {
  _TodoImpl({
    int? id,
    required String description,
    required bool isDone,
  }) : super._(
          id: id,
          description: description,
          isDone: isDone,
        );

  @override
  Todo copyWith({
    Object? id = _Undefined,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
