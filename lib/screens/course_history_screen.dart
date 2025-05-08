import 'package:flutter/material.dart';

class CourseHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> completedCourses = [
    {
      'title': 'Dasar Digital Marketing',
      'date': '12 Mei 2025',
      'badge': 'Marketing Pro',
    },
    {
      'title': 'Pemrograman Flutter',
      'date': '28 April 2025',
      'badge': 'Flutter Dev',
    },
    {
      'title': 'Keterampilan Komunikasi',
      'date': '20 Maret 2025',
      'badge': 'Communication Master',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kursus & Badge')),
      body: ListView.builder(
        itemCount: completedCourses.length,
        itemBuilder: (context, index) {
          final course = completedCourses[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.blue),
              title: Text(course['title']!),
              subtitle: Text('Selesai: ${course['date']}'),
              trailing: Chip(
                label: Text(course['badge']!),
                backgroundColor: Colors.green[100],
              ),
            ),
          );
        },
      ),
    );
  }
}
