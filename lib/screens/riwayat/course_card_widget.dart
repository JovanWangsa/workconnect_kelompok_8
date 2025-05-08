import 'package:flutter/material.dart';

class CourseCardWidget extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseCardWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(course['title']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kategori: ${course['category']}"),
            Text("Selesai: ${course['date']}"),
            LinearProgressIndicator(value: course['progress']),
          ],
        ),
        trailing: Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}
