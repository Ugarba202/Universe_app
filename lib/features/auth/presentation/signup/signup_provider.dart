import 'package:flutter_riverpod/legacy.dart';
import 'signup_state.dart';

class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier() : super(SignupState());

  // STEP 1
  void updateName(String name) {
    state = state.copyWith(fullName: name, error: null);
  }

  void updateRegistrationNumber(String regNo) {
    state = state.copyWith(registrationNumber: regNo, error: null);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender, error: null);
  }

  bool validateStepOne() {
    if (state.fullName.isEmpty ||
        state.registrationNumber.isEmpty ||
        state.gender.isEmpty) {
      state = state.copyWith(error: 'All fields including gender are required');
      return false;
    }
    return true;
  }

  // STEP 2
  void updateProgramType(String value) {
    state = state.copyWith(programType: value, error: null);
  }

  void updateFaculty(String value) {
    state = state.copyWith(faculty: value, department: '', error: null);
  }

  void updateDepartment(String value) {
    state = state.copyWith(department: value, error: null);
  }

  void updateLevel(String value) {
    state = state.copyWith(level: value, error: null);
  }

  bool validateStepTwo() {
    if (state.programType.isEmpty ||
        state.faculty.isEmpty ||
        state.department.isEmpty ||
        state.level.isEmpty) {
      state = state.copyWith(error: 'Please complete all academic fields');
      return false;
    }
    return true;
  }
    // STEP 3
  void updatePassword(String value) {
    state = state.copyWith(password: value, error: null);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value, error: null);
  }

  bool validateStepThree() {
    if (state.password.isEmpty ||
        state.confirmPassword.isEmpty) {
      state = state.copyWith(
          error: 'Password fields cannot be empty');
      return false;
    }

    if (state.password.length < 6) {
      state = state.copyWith(
          error: 'Password must be at least 6 characters');
      return false;
    }

    if (state.password != state.confirmPassword) {
      state = state.copyWith(
          error: 'Passwords do not match');
      return false;
    }

    return true;
  }

  void updatePhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value, error: null);
  }

  void updateAvatar(String path) {
    state = state.copyWith(profileImagePath: path, error: null);
  }

  void updateFacultyOnly(String value) {
    state = state.copyWith(faculty: value, error: null);
  }

  void updateDepartmentOnly(String value) {
    state = state.copyWith(department: value, error: null);
  }
}

final signupProvider = StateNotifierProvider<SignupNotifier, SignupState>(
  (ref) => SignupNotifier(),
);
