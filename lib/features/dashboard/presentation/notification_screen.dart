import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'course_materials_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications data
    final notifications = [
      _NotificationItem(
        title: 'New Material Uploaded',
        message: 'Past Question (2023) added to CSC 301. Tap to view.',
        time: '2 mins ago',
        isRead: false,
        courseCode: 'CSC 301',
        courseTitle: 'Introduction to Algorithms',
      ),
      _NotificationItem(
        title: 'New Reading Material',
        message: 'Lecture Notes regarding "Data Structures" added to CSC 302.',
        time: '1 hour ago',
        isRead: false,
        courseCode: 'CSC 302',
        courseTitle: 'Data Structures',
      ),
      _NotificationItem(
        title: 'Exam Schedule Update',
        message: 'The examination timetable for 300 Level has been updated.',
        time: '5 hours ago',
        isRead: true,
        // No course link for general announcements
      ),
       _NotificationItem(
        title: 'System Maintenance',
        message: 'The Materials Hub will undergo maintenance this weekend.',
        time: '1 day ago',
        isRead: true,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all_rounded, color: AppColors.primaryGreen),
            onPressed: () {
              // TODO: Mark all as read logic
            },
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            tileColor: item.isRead ? Colors.transparent : AppColors.primaryGreen.withOpacity(0.05),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: item.isRead ? Colors.grey[100] : AppColors.primaryGreen.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.courseCode != null ? Icons.library_books_rounded : Icons.notifications_rounded,
                color: item.isRead ? Colors.grey : AppColors.primaryGreen,
                size: 24,
              ),
            ),
            title: Text(
              item.title,
              style: TextStyle(
                fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold,
                color: AppColors.textDark,
                fontSize: 15,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item.message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.time,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            onTap: () {
              if (item.courseCode != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseMaterialsScreen(
                      courseCode: item.courseCode!,
                      courseTitle: item.courseTitle ?? item.courseCode!,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _NotificationItem {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final String? courseCode;
  final String? courseTitle;

  _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    this.courseCode,
    this.courseTitle,
  });
}
