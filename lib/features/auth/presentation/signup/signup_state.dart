class SignupState {
  final String fullName;
  final String registrationNumber;

  final String programType;
  final String faculty;
  final String department;
  final String level;

  final String password;
  final String confirmPassword;

  final String gender;
  final String phoneNumber;
  final String? profileImagePath;
  final String? error;

  SignupState({
    this.fullName = '',
    this.registrationNumber = '',
    this.programType = '',
    this.faculty = '',
    this.department = '',
    this.level = '',
    this.password = '',
    this.confirmPassword = '',
    this.gender = '',
    this.phoneNumber = '',
    this.profileImagePath,
    this.error,
  });

  SignupState copyWith({
    String? fullName,
    String? registrationNumber,
    String? programType,
    String? faculty,
    String? department,
    String? level,
    String? password,
    String? confirmPassword,
    String? gender,
    String? phoneNumber,
    String? profileImagePath,
    String? error,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      registrationNumber:
          registrationNumber ?? this.registrationNumber,
      programType: programType ?? this.programType,
      faculty: faculty ?? this.faculty,
      department: department ?? this.department,
      level: level ?? this.level,
      password: password ?? this.password,
      confirmPassword:
          confirmPassword ?? this.confirmPassword,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      error: error,
    );
  }
}
