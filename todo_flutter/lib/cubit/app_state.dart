part of 'app_cubit.dart';

enum AppStatus { initial, disconnect }

class AppState extends Equatable {
  const AppState._({
    required this.status,
  });

  const AppState.initial() : this._(status: AppStatus.initial);

  final AppStatus status;

  AppState copyWith({
    User? user,
    AppStatus? status,
  }) {
    return AppState._(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
