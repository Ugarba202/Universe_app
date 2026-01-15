import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
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
    // Initialize with current user level
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userState = ref.read(signupProvider);
      setState(() {
        _selectedLevel = userState.level.isNotEmpty ? userState.level : null;
      });
    });
  }

  void _saveChanges() {
    if (_selectedLevel != null) {
      ref.read(signupProvider.notifier).updateLevel(_selectedLevel!);
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: AppColors.primaryGreen),
      );
    }
  }

  void _logout() {
    // Navigate to Login and remove all routes
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(signupProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background for contrast
      appBar: AppBar(
        title: const Text('My Profile',
            style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit_rounded,
                color: AppColors.primaryGreen),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                // Reset selection if cancelling
                if (!_isEditing) {
                  _selectedLevel = userState.level;
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar Section
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryGreen, width: 2),
                ),
                child: Center(
                  child: Icon(
                    userState.gender == 'Female'
                        ? Icons.face_3_rounded
                        : Icons.face_rounded,
                    size: 50,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              userState.registrationNumber,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              userState.email,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 32),

            // Academic Details Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ACADEMIC DETAILS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildReadOnlyField('Faculty', userState.faculty),
                  const Divider(height: 24),
                  _buildReadOnlyField('Department', userState.department),
                  const Divider(height: 24),
                  
                  // Level Field (Editable)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Level',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (_isEditing)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.primaryGreen),
                                ),
                                child: DropdownButtonHideUnderline(
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
                                ),
                              )
                            else
                              Text(
                                '${userState.level} Level',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (_isEditing)
                         const Padding(
                           padding: EdgeInsets.only(left: 8.0),
                           child: Icon(Icons.edit, size: 16, color: AppColors.primaryGreen),
                         ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            if (_isEditing)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),

            if (!_isEditing)
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: _logout,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    foregroundColor: AppColors.error,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       Icon(Icons.logout_rounded),
                       SizedBox(width: 8),
                       Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey, // Grey to verify it's read-only
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Contact admin to change',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    );
  }
}
