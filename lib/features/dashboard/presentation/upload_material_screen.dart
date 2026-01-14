import 'package:flutter/material.dart';

class UploadMaterialScreen extends StatelessWidget {
  const UploadMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Material')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Course'),
              items: const [
                DropdownMenuItem(value: 'CSC201', child: Text('CSC201')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField(
              decoration:
                  const InputDecoration(labelText: 'Material Type'),
              items: const [
                DropdownMenuItem(
                    value: 'Lecture Notes',
                    child: Text('Lecture Notes')),
                DropdownMenuItem(
                    value: 'Past Questions',
                    child: Text('Past Questions')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Year'),
              items: const [
                DropdownMenuItem(value: '2023', child: Text('2023')),
                DropdownMenuItem(value: '2022', child: Text('2022')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 24),

            OutlinedButton.icon(
              onPressed: () {
                // Later: Pick PDF
              },
              icon: const Icon(Icons.attach_file),
              label: const Text('Select PDF'),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                // Later: Upload
              },
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
