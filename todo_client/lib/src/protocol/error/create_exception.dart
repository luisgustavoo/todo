/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class CustomException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  CustomException._({
    required this.message,
    required this.errorType,
  });

  factory CustomException({
    required String message,
    required _i2.ErrorTypeEnum errorType,
  }) = _CustomExceptionImpl;

  factory CustomException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CustomException(
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      errorType: serializationManager
          .deserialize<_i2.ErrorTypeEnum>(jsonSerialization['errorType']),
    );
  }

  String message;

  _i2.ErrorTypeEnum errorType;

  CustomException copyWith({
    String? message,
    _i2.ErrorTypeEnum? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorType': errorType,
    };
  }
}

class _CustomExceptionImpl extends CustomException {
  _CustomExceptionImpl({
    required String message,
    required _i2.ErrorTypeEnum errorType,
  }) : super._(
          message: message,
          errorType: errorType,
        );

  @override
  CustomException copyWith({
    String? message,
    _i2.ErrorTypeEnum? errorType,
  }) {
    return CustomException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
