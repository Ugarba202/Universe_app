import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart' show AppColors;
import '../../auth/presentation/login/login_screen.dart';
import '../../auth/presentation/signup/signup_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  String? _selectedLevel;
  bool _isEditing = false;

  final List<String> _levels = ['100', '200', '300', '400', '500', '600'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userState = ref.read(signupProvider);
      setState(() {
        _selectedLevel = userState.level.isNotEmpty ? userState.level : null;
      });
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      ref.read(signupProvider.notifier).updateAvatar(image.path);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Profile picture updated'),
            backgroundColor: AppColors.primaryGreen),
      );
    }
  }

  void _saveChanges() {
    if (_selectedLevel != null) {
      ref.read(signupProvider.notifier).updateLevel(_selectedLevel!);
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Level updated successfully'),
            backgroundColor: AppColors.primaryGreen),
      );
    }
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signupProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Avatar (With Camera Icon)
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(state.profileImagePath != null ? 0 : 24),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withOpacity(0.08),
                        shape: BoxShape.circle,
                        image: state.profileImagePath != null
                            ? DecorationImage(
                                image: FileImage(File(state.profileImagePath!)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      width: 120,
                      height: 120,
                      child: state.profileImagePath == null
                          ? const Icon(
                              Icons.face_3_rounded,
                              size: 70,
                              color: AppColors.primaryGreen,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Welcome Text (As seen in image)
              Center(
                child: Text(
                  'Welcome!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Your registration summary',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Registration Card (As seen in image)
              _buildSummaryCard(
                icon: Icons.assignment_ind_outlined,
                label: 'Registration Number',
                value: state.registrationNumber,
              ),
              const SizedBox(height: 16),

              // Academic Info Card (As seen in image)
              _buildSummaryCard(
                icon: Icons.account_balance_outlined,
                label: 'Academic Info',
                value: '${state.faculty}\n${state.department}',
              ),
              const SizedBox(height: 16),

              // Level Card (Editable as requested)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isEditing = !_isEditing;
                    if (!_isEditing) _selectedLevel = state.level;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50], // Slightly off-white like in image
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _isEditing ? AppColors.primaryGreen : Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.trending_up_rounded,
                          color: _isEditing ? AppColors.primaryGreen : Colors.green[800],
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Level',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (_isEditing)
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedLevel,
                                  isExpanded: true,
                                  items: _levels.map((String level) {
                                    return DropdownMenuItem<String>(
                                      value: level,
                                      child: Text('$level Level'),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedLevel = newValue;
                                    });
                                  },
                                ),
                              )
                            else
                              Text(
                                '${state.level} Level',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDark,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (!_isEditing)
                        Icon(Icons.edit_rounded, size: 18, color: Colors.grey[400]),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 48),

              if (_isEditing)
                ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Update Level',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              else
                TextButton(
                  onPressed: _logout,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.error,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       Icon(Icons.logout_rounded, size: 20),
                       SizedBox(width: 8),
                       Text(
                        'LOG OUT',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.green[800],
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
