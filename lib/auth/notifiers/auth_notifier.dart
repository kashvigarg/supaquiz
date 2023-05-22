import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supaquiz/auth/enums/auth_state.dart';
import 'package:supaquiz/auth/repository/auth_repository.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final _authRepo = AuthRepository();

  AuthNotifier() : super(const AuthState.unknown()) {
    if (_authRepo.isAlreadyLoggedIn) {
      state = AuthState.loggedIn;
    }
  }

  signUp(String email, String password) async {
    await _authRepo.signUp(email, password);
  }
}
