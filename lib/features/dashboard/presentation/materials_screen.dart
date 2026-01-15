import 'package:flutter/material.dart';
import 'course_materials_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../auth/presentation/signup/academic_data.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key, String courseTitle = ''});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  String? _selectedFaculty;
  String? _selectedDepartment;
  String? _selectedLevel;
  String? _selectedSemester;
  int _selectedTabIndex = 1; // 0 = Past Question, 1 = Reading Material
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  IconData _getFacultyIcon(String faculty) {
    switch (faculty) {
      case 'Administration': return Icons.admin_panel_settings_rounded;
      case 'Agriculture': return Icons.agriculture_rounded;
      case 'Allied Health Sciences': return Icons.medication_rounded;
      case 'Arts': return Icons.palette_rounded;
      case 'Basic Clinical Sciences': return Icons.science_rounded;
      case 'Basic Medical Sciences': return Icons.biotech_rounded;
      case 'Clinical Sciences': return Icons.medical_services_rounded;
      case 'Dental Surgery': return Icons.health_and_safety_rounded;
      case 'Education': return Icons.school_rounded;
      case 'Engineering': return Icons.engineering_rounded;
      case 'Environmental Design': return Icons.architecture_rounded;
      case 'Law': return Icons.gavel_rounded;
      case 'Life Sciences': return Icons.eco_rounded;
      case 'Management Sciences': return Icons.business_center_rounded;
      case 'Pharmacy': return Icons.local_pharmacy_rounded;
      case 'Physical Sciences': return Icons.functions_rounded;
      case 'Social Sciences': return Icons.groups_rounded;
      case 'Veterinary Medicine': return Icons.pets_rounded;
      case 'ABU Business School': return Icons.account_balance_rounded;
      default: return Icons.folder_rounded;
    }
  }

  List<String> _getFilteredItems() {
    List<String> items = [];
    if (_selectedFaculty == null) {
      items = faculties.keys.toList()..sort();
    } else if (_selectedDepartment == null) {
      final facultyDepts = faculties[_selectedFaculty];
      if (facultyDepts != null) {
        items = List<String>.from(facultyDepts)..sort();
      }
    } else if (_selectedLevel == null) {
      items = levels;
    } else if (_selectedSemester == null) {
      // Level is selected, show semesters
      items = ['First Semester', 'Second Semester'];
    } else {
      // Semester is selected, show courses for this dept/level/semester
      if (mockCourses.containsKey(_selectedDepartment)) {
        final deptData = mockCourses[_selectedDepartment];
        if (deptData is Map && deptData!.containsKey(_selectedLevel)) {
          final levelData = deptData[_selectedLevel];
          if (levelData is Map && levelData!.containsKey(_selectedSemester)) {
            final semesterCourses = levelData[_selectedSemester];
            if (semesterCourses is List) {
              items = semesterCourses!.map((code) {
                final title = courseTitles[code] ?? 'Untitled Course';
                return '$code - $title';
              }).toList();
            }
          }
        }
      }
    }

    if (_searchQuery.isEmpty) return items;
    return items
        .where((item) => item.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void _onBack() {
    setState(() {
      if (_selectedSemester != null) {
        _selectedSemester = null;
      } else if (_selectedLevel != null) {
        _selectedLevel = null;
      } else if (_selectedDepartment != null) {
        _selectedDepartment = null;
      } else if (_selectedFaculty != null) {
        _selectedFaculty = null;
      }
      _searchQuery = '';
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _getFilteredItems();
    final title = _selectedSemester != null 
        ? _selectedSemester! 
        : (_selectedLevel ?? (_selectedDepartment ?? (_selectedFaculty ?? 'Material Hub')));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: (_selectedFaculty != null)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textDark),
                onPressed: _onBack,
              )
            : null,
      ),
      body: Column(
        children: [
          // Breadcrumbs
          if (_selectedFaculty != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBreadcrumb('Hub', () => setState(() {
                      _selectedFaculty = null;
                      _selectedDepartment = null;
                      _selectedLevel = null;
                      _selectedSemester = null;
                    })),
                    if (_selectedFaculty != null) ...[
                      const Icon(Icons.chevron_right_rounded, size: 16, color: Colors.grey),
                      _buildBreadcrumb(_selectedFaculty!, () => setState(() {
                        _selectedDepartment = null;
                        _selectedLevel = null;
                        _selectedSemester = null;
                      })),
                    ],
                    if (_selectedDepartment != null) ...[
                      const Icon(Icons.chevron_right_rounded, size: 16, color: Colors.grey),
                      _buildBreadcrumb(_selectedDepartment!, () => setState(() {
                        _selectedLevel = null;
                        _selectedSemester = null;
                      })),
                    ],
                    if (_selectedLevel != null) ...[
                      const Icon(Icons.chevron_right_rounded, size: 16, color: Colors.grey),
                      _buildBreadcrumb(_selectedLevel!, () => setState(() {
                        _selectedSemester = null;
                      })),
                    ],
                  ],
                ),
              ),
            ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: _selectedFaculty == null 
                  ? 'Search faculties...' 
                  : (_selectedDepartment == null 
                      ? 'Search departments...' 
                      : (_selectedLevel == null 
                          ? 'Search levels...' 
                          : (_selectedSemester == null 
                              ? 'Search semesters...' 
                              : 'Search courses...'))),
                prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),

          // Material Type Tabs (shown when semester is selected)
          if (_selectedSemester != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTabIndex = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == 0
                              ? AppColors.primaryGreen
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Past Question',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedTabIndex == 0
                                ? Colors.white
                                : AppColors.textDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTabIndex = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == 1
                              ? AppColors.primaryGreen
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Reading Material',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedTabIndex == 1
                                ? Colors.white
                                : AppColors.textDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Content Grid or List
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open_rounded, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          'No items found',
                          style: TextStyle(color: Colors.grey[500], fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : _selectedSemester != null
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          return _CourseListTile(
                            courseName: item,
                            onTap: () {
                              final parts = item.split(' - ');
                              final code = parts[0];
                              final title = parts.length > 1 ? parts[1] : '';
                              
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseMaterialsScreen(
                                    courseCode: code,
                                    courseTitle: title,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          return _FolderCard(
                            name: item,
                            icon: _selectedFaculty == null 
                                ? _getFacultyIcon(item)
                                : (_selectedDepartment == null 
                                    ? Icons.school_rounded 
                                    : (_selectedLevel == null 
                                        ? Icons.layers_rounded 
                                        : (_selectedSemester == null 
                                            ? Icons.calendar_today_rounded 
                                            : Icons.description_rounded))),
                            itemCount: null,
                            onTap: () {
                              setState(() {
                                if (_selectedFaculty == null) {
                                  _selectedFaculty = item;
                                } else if (_selectedDepartment == null) {
                                  _selectedDepartment = item;
                                } else if (_selectedLevel == null) {
                                  _selectedLevel = item;
                                } else if (_selectedSemester == null) {
                                  _selectedSemester = item;
                                }
                                _searchQuery = '';
                                _searchController.clear();
                              });
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryGreen,
          ),
        ),
      ),
    );
  }
}

class _FolderCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final int? itemCount;
  final VoidCallback onTap;

  const _FolderCard({
    required this.name,
    required this.icon,
    this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primaryGreen),
            const SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.textDark,
              ),
            ),
            if (itemCount != null) ...[
              const SizedBox(height: 4),
              Text(
                '$itemCount items',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CourseListTile extends StatelessWidget {
  final String courseName;
  final VoidCallback onTap;

  const _CourseListTile({
    required this.courseName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.folder_rounded,
            color: AppColors.primaryGreen,
            size: 24,
          ),
        ),
        title: Text(
          courseName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.textDark,
          ),
        ),
        subtitle: const Text(
          'Empty folder',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
