import 'package:flutter_riverpod/legacy.dart';
import 'package:file_picker/file_picker.dart';
import 'upload_state.dart';

class UploadNotifier extends StateNotifier<UploadState> {
  UploadNotifier() : super(UploadState());

  void setType(MaterialUploadType type) {
    state = state.copyWith(type: type, currentStep: 1, error: null);
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

  void updateCourseCode(String value) {
    state = state.copyWith(courseCode: value, error: null);
  }

  void updateCourseTitle(String value) {
    state = state.copyWith(courseTitle: value, error: null);
  }

  void updateYear(String value) {
    state = state.copyWith(year: value, error: null);
  }

  void updateSemester(String value) {
    state = state.copyWith(semester: value, error: null);
  }

  void updateDescription(String value) {
    state = state.copyWith(description: value, error: null);
  }

  void setIsAddingNewCourse(bool value) {
    state = state.copyWith(isAddingNewCourse: value, error: null);
  }

  void addNewCourseCode(String code) {
    final Map<String, Map<String, List<String>>> newLocal = 
        Map<String, Map<String, List<String>>>.from(state.localCourses.map(
      (key, value) => MapEntry(key, Map<String, List<String>>.from(value)),
    ));

    if (!newLocal.containsKey(state.department)) {
      newLocal[state.department] = {};
    }
    if (!newLocal[state.department]!.containsKey(state.level)) {
      newLocal[state.department]![state.level] = [];
    }
    
    final normalizedCode = code.trim().toUpperCase();
    if (normalizedCode.isNotEmpty && 
        !newLocal[state.department]![state.level]!.contains(normalizedCode)) {
      newLocal[state.department]![state.level]!.add(normalizedCode);
    }
    
    state = state.copyWith(
      localCourses: newLocal,
      courseCode: normalizedCode,
      isAddingNewCourse: false,
      error: null,
    );
  }

  void setFile(PlatformFile? file) {
    state = state.copyWith(pickedFile: file, error: null);
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void prevStep() {
    state = state.copyWith(currentStep: state.currentStep - 1);
  }

  Future<bool> checkDuplicates() async {
    state = state.copyWith(isSubmitting: true, error: null);
    
    // Simulate API call to check for duplicates
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock duplicate check: CSC 101 or "Introduction to CSC" is a "duplicate" for demo
    if (state.courseCode.toUpperCase() == 'CSC 101' || 
        state.courseTitle.toLowerCase().contains('introduction to csc')) {
      state = state.copyWith(
        isSubmitting: false, 
        error: 'A material with this course code/title already exists in ${state.level} Level.'
      );
      return false;
    }
    
    state = state.copyWith(isSubmitting: false);
    return true;
  }

  Future<void> upload() async {
    state = state.copyWith(isSubmitting: true, error: null);
    
    // Simulate file upload
    await Future.delayed(const Duration(seconds: 2));
    
    state = state.copyWith(isSubmitting: false, isSuccess: true);
  }

  void reset() {
    state = UploadState();
  }
}

final uploadProvider = StateNotifierProvider<UploadNotifier, UploadState>(
  (ref) => UploadNotifier(),
);
