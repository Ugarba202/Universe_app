import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'dashboard_screen.dart';
import 'materials_screen.dart';
import '../../materials/presentation/upload_material_screen.dart';
import 'profile_screen.dart';



class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    MaterialsScreen(courseTitle: ''),
    UploadMaterialScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primaryGreen,
          unselectedItemColor: AppColors.textLight.withOpacity(0.5),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded, size: 24),
              activeIcon: Icon(Icons.grid_view_rounded, size: 28),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy_rounded, size: 24),
              activeIcon: Icon(Icons.folder_copy_rounded, size: 28),
              label: 'Materials',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded, size: 24),
              activeIcon: Icon(Icons.add_box_rounded, size: 28),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded, size: 24),
              activeIcon: Icon(Icons.account_circle_rounded, size: 28),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
