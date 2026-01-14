import 'package:file_picker/file_picker.dart';

enum MaterialUploadType { pastQuestion, readingMaterial }

class UploadState {
  final MaterialUploadType? type;
  final String faculty;
  final String department;
  final String level;
  final String courseCode;
  final String courseTitle;
  final String year; // For past questions
  final String semester; // For reading materials
  final String description;
  final PlatformFile? pickedFile;
  final int currentStep;
  final String? error;
  final bool isSubmitting;
  final Map<String, Map<String, List<String>>> localCourses;
  final bool isAddingNewCourse;
  final bool isSuccess;

  UploadState({
    this.type,
    this.faculty = '',
    this.department = '',
    this.level = '',
    this.courseCode = '',
    this.courseTitle = '',
    this.year = '',
    this.semester = '',
    this.description = '',
    this.pickedFile,
    this.currentStep = 0,
    this.error,
    this.isSubmitting = false,
    this.localCourses = const {},
    this.isAddingNewCourse = false,
    this.isSuccess = false,
  });

  UploadState copyWith({
    MaterialUploadType? type,
    String? faculty,
    String? department,
    String? level,
    String? courseCode,
    String? courseTitle,
    String? year,
    String? semester,
    String? description,
    PlatformFile? pickedFile,
    int? currentStep,
    String? error,
    bool? isSubmitting,
    Map<String, Map<String, List<String>>>? localCourses,
    bool? isAddingNewCourse,
    bool? isSuccess,
  }) {
    return UploadState(
      type: type ?? this.type,
      faculty: faculty ?? this.faculty,
      department: department ?? this.department,
      level: level ?? this.level,
      courseCode: courseCode ?? this.courseCode,
      courseTitle: courseTitle ?? this.courseTitle,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      description: description ?? this.description,
      pickedFile: pickedFile ?? this.pickedFile,
      currentStep: currentStep ?? this.currentStep,
      error: error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      localCourses: localCourses ?? this.localCourses,
      isAddingNewCourse: isAddingNewCourse ?? this.isAddingNewCourse,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
