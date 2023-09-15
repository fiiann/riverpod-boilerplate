import 'package:flutter_boilerplate/app/state/app_start_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum Status { initial, loading, success, failed }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Status.initial) Status status,
    @Default(AppStartState.initial()) AppStartState authStatus,
    String? message,
  }) = _AuthState;
}
