import 'package:flutter/material.dart';

import 'materials_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      'CSC201 - Data Structures',
      'MTH201 - Calculus II',
      'EEE203 - Circuit Theory',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(courses[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => MaterialsScreen(
        courseTitle: courses[index],
      ),
    ),
  );
},

          );
        },
      ),
    );
  }
}
