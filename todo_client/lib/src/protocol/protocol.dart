/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'enums/error_enum.dart' as _i2;
import 'error/create_exception.dart' as _i3;
import 'todo.dart' as _i4;
import 'user.dart' as _i5;
import 'package:todo_client/src/protocol/todo.dart' as _i6;
import 'package:serverpod_auth_client/module.dart' as _i7;
export 'enums/error_enum.dart';
export 'error/create_exception.dart';
export 'todo.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.ErrorTypeEnum) {
      return _i2.ErrorTypeEnum.fromJson(data) as T;
    }
    if (t == _i3.CustomException) {
      return _i3.CustomException.fromJson(data, this) as T;
    }
    if (t == _i4.Todo) {
      return _i4.Todo.fromJson(data, this) as T;
    }
    if (t == _i5.User) {
      return _i5.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ErrorTypeEnum?>()) {
      return (data != null ? _i2.ErrorTypeEnum.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CustomException?>()) {
      return (data != null ? _i3.CustomException.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.Todo?>()) {
      return (data != null ? _i4.Todo.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.User?>()) {
      return (data != null ? _i5.User.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.Todo>) {
      return (data as List).map((e) => deserialize<_i6.Todo>(e)).toList()
          as dynamic;
    }
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i7.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.ErrorTypeEnum) {
      return 'ErrorTypeEnum';
    }
    if (data is _i3.CustomException) {
      return 'CustomException';
    }
    if (data is _i4.Todo) {
      return 'Todo';
    }
    if (data is _i5.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'ErrorTypeEnum') {
      return deserialize<_i2.ErrorTypeEnum>(data['data']);
    }
    if (data['className'] == 'CustomException') {
      return deserialize<_i3.CustomException>(data['data']);
    }
    if (data['className'] == 'Todo') {
      return deserialize<_i4.Todo>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i5.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
