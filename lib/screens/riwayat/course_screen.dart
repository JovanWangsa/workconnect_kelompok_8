import 'package:flutter/material.dart';
import 'badge_widget.dart';
import 'course_card_widget.dart';

class CourseScreen extends StatelessWidget {
  final List<Map<String, dynamic>> completedCourses = [
    {
      'title': 'Belajar Flutter Dasar',
      'category': 'Teknologi',
      'progress': 1.0,
      'date': '2025-05-01',
      'badge': 'Flutter Beginner',
    },
    {
      'title': 'Dasar-dasar Digital Marketing',
      'category': 'Marketing',
      'progress': 1.0,
      'date': '2025-04-20',
      'badge': 'Marketing Novice',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kursus & Badge')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            '📘 Kursus Diselesaikan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ...completedCourses
              .map((course) => CourseCardWidget(course: course))
              .toList(),
          SizedBox(height: 24),
          Text(
            '🏅 Badge Skill Diperoleh',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children:
                completedCourses
                    .map((course) => BadgeWidget(badgeName: course['badge']))
                    .toList(),
          ),
        ],
      ),
    );
  }
}
