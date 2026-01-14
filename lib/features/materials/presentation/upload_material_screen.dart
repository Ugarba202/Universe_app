import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../../../core/theme/app_colors.dart';
import 'upload_provider.dart';
import 'upload_state.dart';
import '../../auth/presentation/signup/academic_data.dart';

class UploadMaterialScreen extends ConsumerWidget {
  const UploadMaterialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);

    if (state.isSuccess) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _SuccessView(onReset: notifier.reset),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Upload Material',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildTypeToggle(state, notifier),
          const SizedBox(height: 32),
          
          _buildSectionHeader('Institutional Details'),
          const SizedBox(height: 16),
          _SelectorField(
            label: 'Faculty',
            value: state.faculty.isEmpty ? 'Select Faculty' : state.faculty,
            icon: Icons.account_balance_rounded,
            onTap: () => _showSearchableSelection(
              context,
              title: 'Select Faculty',
              items: faculties.keys.toList(),
              onSelected: notifier.updateFaculty,
            ),
          ),
          const SizedBox(height: 20),
          _SelectorField(
            label: 'Department',
            value: state.department.isEmpty ? 'Select Department' : state.department,
            icon: Icons.school_rounded,
            onTap: state.faculty.isEmpty
                ? null
                : () => _showSearchableSelection(
                      context,
                      title: 'Select Department',
                      items: (faculties[state.faculty])
                              ?.map((e) => e.toString())
                              .toList() ??
                          [],
                      onSelected: (value) => notifier.updateDepartment(value),
                    ),
          ),
          const SizedBox(height: 20),
          _buildLevelDropdown(state, notifier),
          
          const SizedBox(height: 40),
          _buildSectionHeader('Course Information'),
          const SizedBox(height: 16),
          _buildCourseCodeSection(context, state, notifier),
          const SizedBox(height: 20),
          _InputField(
            label: 'Course Title',
            hint: 'e.g. Data Structures & Algorithms',
            onChanged: notifier.updateCourseTitle,
          ),
          const SizedBox(height: 20),
          _buildConditionalField(state, notifier),
          
          const SizedBox(height: 40),
          _buildSectionHeader('File & Description'),
          const SizedBox(height: 16),
          _buildFilePicker(state, notifier),
          const SizedBox(height: 20),
          _InputField(
            label: 'Description',
            hint: 'Add a short note about this material...',
            onChanged: notifier.updateDescription,
            maxLines: 3,
          ),
          
          if (state.error != null) _buildErrorCard(state.error!),
          
          const SizedBox(height: 48),
          _buildSubmitButton(state, notifier),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTypeToggle(UploadState state, UploadNotifier notifier) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _Segment(
            title: 'Past Question',
            isActive: state.type == MaterialUploadType.pastQuestion,
            onTap: () => notifier.setType(MaterialUploadType.pastQuestion),
          ),
          _Segment(
            title: 'Reading Material',
            isActive: state.type == MaterialUploadType.readingMaterial,
            onTap: () => notifier.setType(MaterialUploadType.readingMaterial),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: AppColors.primaryGreen,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildLevelDropdown(UploadState state, UploadNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Academic Level',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: state.level.isEmpty ? null : state.level,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          items: levels
              .map((l) => DropdownMenuItem(value: l, child: Text('$l Level')))
              .toList(),
          onChanged: (val) {
            if (val != null) notifier.updateLevel(val);
          },
        ),
      ],
    );
  }

  Widget _buildCourseCodeSection(BuildContext context, UploadState state, UploadNotifier notifier) {
    final availableCourses = _getAvailableCourses(state);
    
    if (state.isAddingNewCourse) {
      return Column(
        children: [
          _InputField(
            label: 'New Course Code',
            hint: 'e.g. CSC 301',
            onChanged: notifier.updateCourseCode,
            autofocus: true,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => notifier.setIsAddingNewCourse(false),
                child: const Text('Back to selection', style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: state.courseCode.isNotEmpty
                    ? () => notifier.addNewCourseCode(state.courseCode)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text('Add Code'),
              ),
            ],
          ),
        ],
      );
    }

    return _SelectorField(
      label: 'Course Code',
      value: state.courseCode.isEmpty ? 'Select Course Code' : state.courseCode,
      icon: Icons.tag_rounded,
      onTap: () => _showCourseSelection(
        context,
        items: availableCourses,
        onSelected: notifier.updateCourseCode,
        onAddNew: () => notifier.setIsAddingNewCourse(true),
      ),
    );
  }

  List<String> _getAvailableCourses(UploadState state) {
    final List<String> courses = [];
    if (mockCourses.containsKey(state.department)) {
      final deptLevelCourses = mockCourses[state.department]?[state.level];
      if (deptLevelCourses != null) {
        courses.addAll(deptLevelCourses);
      }
    }
    final localDeptCourses = state.localCourses[state.department]?[state.level];
    if (localDeptCourses != null) {
      for (final code in localDeptCourses) {
        if (!courses.contains(code)) courses.add(code);
      }
    }
    return courses..sort();
  }

  Widget _buildConditionalField(UploadState state, UploadNotifier notifier) {
    if (state.type == MaterialUploadType.pastQuestion) {
      return _InputField(
        label: 'Examination Year',
        hint: 'e.g. 2023',
        onChanged: notifier.updateYear,
        keyboardType: TextInputType.number,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Semester',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: state.semester.isEmpty ? null : state.semester,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          items: ['1st Semester', '2nd Semester']
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
          onChanged: (val) {
            if (val != null) notifier.updateSemester(val);
          },
        ),
      ],
    );
  }

  Widget _buildFilePicker(UploadState state, UploadNotifier notifier) {
    return InkWell(
      onTap: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
        );
        if (result != null) notifier.setFile(result.files.first);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.primaryGreen.withOpacity(0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: state.pickedFile != null ? AppColors.primaryGreen : AppColors.primaryGreen.withOpacity(0.3),
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              state.pickedFile != null ? Icons.check_circle_rounded : Icons.cloud_upload_rounded,
              color: AppColors.primaryGreen,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              state.pickedFile?.name ?? 'Tap to select PDF or Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: state.pickedFile != null ? AppColors.textDark : Colors.grey[600],
                fontWeight: state.pickedFile != null ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(String error) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.error),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              error,
              style: const TextStyle(color: AppColors.error, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(UploadState state, UploadNotifier notifier) {
    final bool canSubmit = state.faculty.isNotEmpty &&
        state.department.isNotEmpty &&
        state.level.isNotEmpty &&
        state.courseCode.isNotEmpty &&
        state.courseTitle.isNotEmpty &&
        state.pickedFile != null &&
        (state.type == MaterialUploadType.pastQuestion ? state.year.isNotEmpty : state.semester.isNotEmpty);

    return ElevatedButton(
      onPressed: canSubmit && !state.isSubmitting
          ? () async {
              final isUnique = await notifier.checkDuplicates();
              if (isUnique) notifier.upload();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
      child: state.isSubmitting
          ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : const Text('Upload Material', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  void _showSearchableSelection(BuildContext context, {required String title, required List<String> items, required void Function(String) onSelected}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProfileSearchableBottomSheet(title: title, items: items, onSelected: onSelected),
    );
  }

  void _showCourseSelection(BuildContext context, {required List<String> items, required void Function(String) onSelected, required VoidCallback onAddNew}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CourseSearchBottomSheet(items: items, onSelected: onSelected, onAddNew: onAddNew),
    );
  }
}

class _Segment extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _Segment({required this.title, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isActive
                ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]
                : null,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppColors.primaryGreen : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _TypeSelectionStep extends StatelessWidget {
  final void Function(MaterialUploadType) onSelected;

  const _TypeSelectionStep({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'What would you like to share?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryGreen,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose the type of material you want to contribute to the hub.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          _TypeCard(
            title: 'Past Question',
            subtitle: 'Exams and tests from previous years.',
            icon: Icons.history_edu_rounded,
            color: Colors.blue,
            onTap: () => onSelected(MaterialUploadType.pastQuestion),
          ),
          const SizedBox(height: 16),
          _TypeCard(
            title: 'Reading Material',
            subtitle: 'Handouts, notes, textbooks, and summaries.',
            icon: Icons.menu_book_rounded,
            color: Colors.orange,
            onTap: () => onSelected(MaterialUploadType.readingMaterial),
          ),
        ],
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _TypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
class _MetadataStep extends StatelessWidget {
  final UploadState state;
  final UploadNotifier notifier;
  final VoidCallback onContinue;

  const _MetadataStep({
    required this.state,
    required this.notifier,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Institutional Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 32),
        _SelectorField(
          label: 'Faculty',
          value: state.faculty.isEmpty ? 'Select Faculty' : state.faculty,
          icon: Icons.account_balance_rounded,
          onTap: () => _showSearchableSelection(
            context,
            title: 'Select Faculty',
            items: faculties.keys.toList(),
            onSelected: notifier.updateFaculty,
          ),
        ),
        const SizedBox(height: 24),
        _SelectorField(
          label: 'Department',
          value: state.department.isEmpty ? 'Select Department' : state.department,
          icon: Icons.school_rounded,
          onTap: state.faculty.isEmpty
              ? null
              : () => _showSearchableSelection(
                    context,
                    title: 'Select Department',
                    items: (faculties[state.faculty] as List<String>?) ?? [],
                    onSelected: (value) => notifier.updateDepartment(value),
                  ),
        ),
        const SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Academic Level',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: state.level.isEmpty ? null : state.level,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              items: levels
                  .map((l) => DropdownMenuItem(value: l, child: Text('$l Level')))
                  .toList(),
              onChanged: (val) {
                if (val != null) notifier.updateLevel(val);
              },
            ),
          ],
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: state.faculty.isNotEmpty &&
                  state.department.isNotEmpty &&
                  state.level.isNotEmpty
              ? onContinue
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _showSearchableSelection(
    BuildContext context, {
    required String title,
    required List<String> items,
    required void Function(String) onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProfileSearchableBottomSheet(
        title: title,
        items: items,
        onSelected: onSelected,
      ),
    );
  }
}

// ignore: unused_element
class _CourseDetailsStep extends StatelessWidget {
  final UploadState state;
  final UploadNotifier notifier;
  final VoidCallback onContinue;

  const _CourseDetailsStep({
    required this.state,
    required this.notifier,
    required this.onContinue,
  });

  List<String> _getAvailableCourses() {
    final List<String> courses = [];
    
    // Get from mock data
    if (mockCourses.containsKey(state.department)) {
      final deptLevelCourses = mockCourses[state.department]?[state.level];
      if (deptLevelCourses != null) {
        courses.addAll(deptLevelCourses);
      }
    }
    
    // Get from local session data
    final localDeptCourses = state.localCourses[state.department]?[state.level];
    if (localDeptCourses != null) {
      for (final code in localDeptCourses) {
        if (!courses.contains(code)) {
          courses.add(code);
        }
      }
    }
    
    return courses..sort();
  }

  @override
  Widget build(BuildContext context) {
    final isPastQuestion = state.type == MaterialUploadType.pastQuestion;
    final availableCourses = _getAvailableCourses();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Course Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Help others find your material by selecting or adding the correct course code.',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 32),
        
        if (state.isAddingNewCourse) ...[
          _InputField(
            label: 'New Course Code',
            hint: 'e.g. CSC 301',
            onChanged: notifier.updateCourseCode,
            autofocus: true,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () => notifier.setIsAddingNewCourse(false),
                icon: const Icon(Icons.close_rounded, size: 18),
                label: const Text('Cancel'),
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: state.courseCode.isNotEmpty
                    ? () => notifier.addNewCourseCode(state.courseCode)
                    : null,
                icon: const Icon(Icons.check_rounded, size: 18),
                label: const Text('Add Course'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ] else
          _SelectorField(
            label: 'Course Code',
            value: state.courseCode.isEmpty ? 'Select Course Code' : state.courseCode,
            icon: Icons.tag_rounded,
            onTap: () => _showCourseSelection(
              context,
              items: availableCourses,
              onSelected: notifier.updateCourseCode,
              onAddNew: () => notifier.setIsAddingNewCourse(true),
            ),
          ),
        
        const SizedBox(height: 24),
        _InputField(
          label: 'Course Title',
          hint: 'e.g. Data Structures & Algorithms',
          onChanged: notifier.updateCourseTitle,
        ),
        const SizedBox(height: 24),
        if (isPastQuestion)
          _InputField(
            label: 'Year',
            hint: 'e.g. 2023',
            onChanged: notifier.updateYear,
            keyboardType: TextInputType.number,
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Semester',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: state.semester.isEmpty ? null : state.semester,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                items: ['1st Semester', '2nd Semester']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) notifier.updateSemester(val);
                },
              ),
            ],
          ),
        if (state.error != null)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.error.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline_rounded, color: AppColors.error),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      state.error!,
                      style: const TextStyle(color: AppColors.error, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: state.isSubmitting ||
                  state.courseCode.isEmpty ||
                  state.courseTitle.isEmpty ||
                  (isPastQuestion ? state.year.isEmpty : state.semester.isEmpty)
              ? null
              : onContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: state.isSubmitting
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
        ),
      ],
    );
  }

  void _showCourseSelection(
    BuildContext context, {
    required List<String> items,
    required void Function(String) onSelected,
    required VoidCallback onAddNew,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CourseSearchBottomSheet(
        items: items,
        onSelected: onSelected,
        onAddNew: onAddNew,
      ),
    );
  }
}

class _CourseSearchBottomSheet extends StatefulWidget {
  final List<String> items;
  final void Function(String) onSelected;
  final VoidCallback onAddNew;

  const _CourseSearchBottomSheet({
    required this.items,
    required this.onSelected,
    required this.onAddNew,
  });

  @override
  State<_CourseSearchBottomSheet> createState() => _CourseSearchBottomSheetState();
}

class _CourseSearchBottomSheetState extends State<_CourseSearchBottomSheet> {
  late List<String> _filteredItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _filter(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Select Course Code',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _searchController,
              onChanged: _filter,
              decoration: InputDecoration(
                hintText: 'Search course code...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Add New Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                widget.onAddNew();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add_circle_outline_rounded, color: AppColors.primaryGreen),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        'Can\'t find it? Add New Course Code',
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(
                    child: Text('No courses found. Try adding a new one!'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return ListTile(
                        title: Text(item, style: const TextStyle(fontWeight: FontWeight.w600)),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          widget.onSelected(item);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _FileFinalizeStep extends StatelessWidget {
  final UploadState state;
  final UploadNotifier notifier;
  final VoidCallback onUpload;

  const _FileFinalizeStep({
    required this.state,
    required this.notifier,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Finalize Upload',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Attach Document',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
            );
            if (result != null) {
              notifier.setFile(result.files.first);
            }
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: state.pickedFile != null
                    ? AppColors.primaryGreen
                    : AppColors.primaryGreen.withOpacity(0.2),
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state.pickedFile != null ? Icons.check_circle_rounded : Icons.cloud_upload_rounded,
                  color: AppColors.primaryGreen,
                  size: 40,
                ),
                const SizedBox(height: 12),
                Text(
                  state.pickedFile?.name ?? 'Click to select PDF or Image',
                  style: TextStyle(
                    color: state.pickedFile != null ? AppColors.textDark : Colors.grey,
                    fontWeight: state.pickedFile != null ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        _InputField(
          label: 'Description',
          hint: 'Add a short note about this material...',
          onChanged: notifier.updateDescription,
          maxLines: 4,
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: state.isSubmitting || state.pickedFile == null ? null : onUpload,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: state.isSubmitting
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : const Text(
                  'Upload Material',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
        ),
      ],
    );
  }
}

class _SuccessView extends StatelessWidget {
  final VoidCallback onReset;

  const _SuccessView({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.primaryGreen,
            size: 100,
          ),
          const SizedBox(height: 24),
          const Text(
            'Upload Successful!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Thank you for contributing to the community hub. Your material is now live!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: onReset,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Upload Another',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onReset, // Navigate to dashboard in real app
            child: const Text('Back to Dashboard'),
          ),
        ],
      ),
    );
  }
}

// Reusable Components (Simplified version for Upload)
class _SelectorField extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  const _SelectorField({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primaryGreen, size: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: value.contains('Select') ? Colors.grey : AppColors.textDark,
                    ),
                  ),
                ),
                const Icon(Icons.search_rounded, color: AppColors.primaryGreen, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final int maxLines;
  final bool autofocus;

  const _InputField({
    required this.label,
    required this.hint,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          maxLines: maxLines,
          autofocus: autofocus,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileSearchableBottomSheet extends StatefulWidget {
  final String title;
  final List<String> items;
  final void Function(String) onSelected;

  const _ProfileSearchableBottomSheet({
    required this.title,
    required this.items,
    required this.onSelected,
  });

  @override
  State<_ProfileSearchableBottomSheet> createState() => _ProfileSearchableBottomSheetState();
}

class _ProfileSearchableBottomSheetState extends State<_ProfileSearchableBottomSheet> {
  late List<String> _filteredItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _filter(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryGreen,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _searchController,
              onChanged: _filter,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search,
                    color: AppColors.primaryGreen, size: 20),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return ListTile(
                  title: Text(item),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    widget.onSelected(item);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
