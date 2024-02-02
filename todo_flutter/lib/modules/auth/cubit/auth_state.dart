part of 'auth_cubit.dart';

enum AuthStatus { initial }

class AuthState extends Equatable {
  const AuthState._({required this.status});

  const AuthState.initial() : this._(status: AuthStatus.initial);

  final AuthStatus status;

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState._(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
