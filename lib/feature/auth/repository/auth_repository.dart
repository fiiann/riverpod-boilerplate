import 'package:flutter_boilerplate/app/state/app_start_state.dart';
import 'package:flutter_boilerplate/feature/auth/model/login_response.dart';
import 'package:flutter_boilerplate/feature/auth/repository/user_repository.dart';
import 'package:flutter_boilerplate/feature/auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/network/dio/api_provider.dart';

abstract class AuthRepositoryProtocol {
  Future<AuthState> login(String email, String password);

  Future<AuthState> signUp(String name, String email, String password);
}

final authRepositoryProvider = Provider(AuthRepository.new);

class AuthRepository implements AuthRepositoryProtocol {
  AuthRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AuthState> login(String email, String password) async {
    final request = LoginRequest(email: email, password: password);
    try {
      final loginResponse = await _api.login(request: request);
      if (loginResponse.email == email) {
        final tokenRepository = _ref.read(tokenRepositoryProvider);

        await tokenRepository.saveToken(loginResponse);

        return AuthState(
          status: Status.success,
          authStatus: const AppStartState.authenticated(),
          user: loginResponse,
        );
      } else {
        return AuthState(
          status: Status.failed,
          authStatus: const AppStartState.unauthenticated(),
          message: loginResponse.message,
        );
      }
    } catch (e) {
      return AuthState(
        status: Status.failed,
        authStatus: const AppStartState.unauthenticated(),
        message: e.toString(),
      );
    }
    // return loginResponse.when(
    //   success: (success) async {
    //     final tokenRepository = _ref.read(tokenRepositoryProvider);
    //
    //     final token = Token.fromJson(success as Map<String, dynamic>);
    //
    //     await tokenRepository.saveToken(token);
    //
    //     return const AuthState.loggedIn();
    //   },
    //   error: (error) {
    //     return AuthState.error(error);
    //   },
    // );
  }

  @override
  Future<AuthState> signUp(String name, String email, String password) async {
    // TODO(fiiann): SIGNUP REPOSITORY
    /*final loginResponse = await _api.post('sign_up', jsonEncode(params));

    return loginResponse.when(
      success: (success) async {
        final tokenRepository = _ref.read(tokenRepositoryProvider);

        final token = Token.fromJson(success as Map<String, dynamic>);

        await tokenRepository.saveToken(token);

        return const AuthState.loggedIn();
      },
      error: (error) {
        return AuthState.error(error);
      },
    );*/
    return const AuthState(status: Status.success);
  }
}
