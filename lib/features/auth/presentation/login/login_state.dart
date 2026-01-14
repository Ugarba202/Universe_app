class LoginState {
  final String registrationNumber;
  final String password;
  final String? error;

  LoginState({
    this.registrationNumber = '',
    this.password = '',
    this.error,
  });

  LoginState copyWith({
    String? registrationNumber,
    String? password,
    String? error,
  }) {
    return LoginState(
      registrationNumber:
          registrationNumber ?? this.registrationNumber,
      password: password ?? this.password,
      error: error,
    );
  }
}
