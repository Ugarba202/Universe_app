
import 'package:flutter_riverpod/legacy.dart';
import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  void updateRegistrationNumber(String value) {
    state = state.copyWith(
      registrationNumber: value,
      error: null,
    );
  }

  void updatePassword(String value) {
    state = state.copyWith(
      password: value,
      error: null,
    );
  }

  bool validateLogin() {
    if (state.registrationNumber.isEmpty ||
        state.password.isEmpty) {
      state = state.copyWith(
          error: 'All fields are required');
      return false;
    }
    return true;
  }
}

final loginProvider =
    StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);
