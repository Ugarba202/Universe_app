import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CourseMaterialsScreen extends StatelessWidget {
  final String courseCode;
  final String courseTitle;

  const CourseMaterialsScreen({
    super.key,
    required this.courseCode,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseCode,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                courseTitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primaryGreen,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primaryGreen,
            tabs: [
              Tab(text: 'Past Questions'),
              Tab(text: 'Reading Materials'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMaterialList('Past Question'),
            _buildMaterialList('Reading Material'),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialList(String type) {
    // Mock data simulation based on types and course code
    // In a real app, you would filter your materials provider by courseCode AND type
// Toggle this to test empty state


    // Mock List
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: Colors.grey[50], // Subtle background
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.withOpacity(0.2))),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: type == 'Past Question'
                    ? Colors.orange.withOpacity(0.1)
                    : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                type == 'Past Question'
                    ? Icons.quiz_rounded
                    : Icons.menu_book_rounded,
                color: type == 'Past Question' ? Colors.orange : Colors.blue,
              ),
            ),
            title: Text(
              '$courseCode $type ${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Uploaded by User • 2 days ago',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            trailing: const Icon(Icons.download_rounded, color: Colors.grey),
            onTap: () {
              // Open file logic
            },
          ),
        );
      },
    );
  }
}
