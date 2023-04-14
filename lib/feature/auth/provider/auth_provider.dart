import 'package:flutter_boilerplate/feature/auth/repository/auth_repository.dart';
import 'package:flutter_boilerplate/feature/auth/repository/token_repository.dart';
import 'package:flutter_boilerplate/feature/auth/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

//Generated by @riverpod
// final authNotifierProvider =
//     NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  late final AuthRepository _loginRepository = ref.read(authRepositoryProvider);

  Future<void> login(String email, String password) async {
    print(email);
    state = await _loginRepository.login(email, password);
  }

  Future<void> signUp(String name, String email, String password) async {
    state = await _loginRepository.signUp(name, email, password);
  }

  late final TokenRepository _tokenRepository =
      ref.read(tokenRepositoryProvider);

  Future<void> logout() async {
    await _tokenRepository.remove();
    state = const AuthState.loggedOut();
  }
}
