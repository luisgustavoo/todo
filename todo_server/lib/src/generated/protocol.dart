/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'enums/error_enum.dart' as _i4;
import 'error/create_exception.dart' as _i5;
import 'todo.dart' as _i6;
import 'user.dart' as _i7;
import 'package:todo_server/src/generated/todo.dart' as _i8;
export 'enums/error_enum.dart';
export 'error/create_exception.dart';
export 'todo.dart';
export 'user.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'todo',
      dartName: 'Todo',
      schema: 'public',
      module: 'todo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'todo_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isDone',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'todo_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'todo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.ErrorTypeEnum) {
      return _i4.ErrorTypeEnum.fromJson(data) as T;
    }
    if (t == _i5.CustomException) {
      return _i5.CustomException.fromJson(data, this) as T;
    }
    if (t == _i6.Todo) {
      return _i6.Todo.fromJson(data, this) as T;
    }
    if (t == _i7.User) {
      return _i7.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.ErrorTypeEnum?>()) {
      return (data != null ? _i4.ErrorTypeEnum.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CustomException?>()) {
      return (data != null ? _i5.CustomException.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.Todo?>()) {
      return (data != null ? _i6.Todo.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.User?>()) {
      return (data != null ? _i7.User.fromJson(data, this) : null) as T;
    }
    if (t == List<_i8.Todo>) {
      return (data as List).map((e) => deserialize<_i8.Todo>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.ErrorTypeEnum) {
      return 'ErrorTypeEnum';
    }
    if (data is _i5.CustomException) {
      return 'CustomException';
    }
    if (data is _i6.Todo) {
      return 'Todo';
    }
    if (data is _i7.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'ErrorTypeEnum') {
      return deserialize<_i4.ErrorTypeEnum>(data['data']);
    }
    if (data['className'] == 'CustomException') {
      return deserialize<_i5.CustomException>(data['data']);
    }
    if (data['className'] == 'Todo') {
      return deserialize<_i6.Todo>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i7.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.Todo:
        return _i6.Todo.t;
      case _i7.User:
        return _i7.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'todo';
}
