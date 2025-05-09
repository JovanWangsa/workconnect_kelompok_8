import 'package:flutter/material.dart';

class CourseCardWidget extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseCardWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course['title'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text("Kategori: ${course['category']}"),
            SizedBox(height: 4),
            Text("Selesai: ${course['date'].toString().split(' ')[0]}"),
            SizedBox(height: 4),
            LinearProgressIndicator(value: course['progress']),
          ],
        ),
      ),
    );
  }
}
