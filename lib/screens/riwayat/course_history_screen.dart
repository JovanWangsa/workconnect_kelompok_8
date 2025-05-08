import 'package:flutter/material.dart';
import 'course_card_widget.dart';
import 'badge_widget.dart';

class CourseHistoryScreen extends StatefulWidget {
  @override
  _CourseHistoryScreenState createState() => _CourseHistoryScreenState();
}

class _CourseHistoryScreenState extends State<CourseHistoryScreen> {
  List<Map<String, dynamic>> allCourses = [
    {
      'title': 'Belajar Flutter Dasar',
      'category': 'Teknologi',
      'progress': 1.0,
      'date': DateTime(2025, 5, 1),
      'badge': 'Flutter Beginner',
      'description': 'Kursus pemrograman Flutter untuk pemula.',
    },
    {
      'title': 'Digital Marketing Dasar',
      'category': 'Marketing',
      'progress': 1.0,
      'date': DateTime(2025, 4, 20),
      'badge': 'Marketing Novice',
      'description': 'Pelajari dasar-dasar digital marketing.',
    },
    {
      'title': 'UI/UX Design Thinking',
      'category': 'Desain',
      'progress': 1.0,
      'date': DateTime(2025, 4, 10),
      'badge': 'UX Explorer',
      'description': 'Pelajari prinsip desain UI/UX.',
    },
  ];

  String selectedCategory = 'Semua';
  String sortBy = 'Terbaru';

  List<String> categories = ['Semua', 'Teknologi', 'Marketing', 'Desain'];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCourses =
        allCourses.where((course) {
          if (selectedCategory == 'Semua') return true;
          return course['category'] == selectedCategory;
        }).toList();

    if (sortBy == 'Terlama') {
      filteredCourses.sort((a, b) => a['date'].compareTo(b['date']));
    } else {
      filteredCourses.sort((a, b) => b['date'].compareTo(a['date']));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kursus & Badge')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Filter dan Sort
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                    items:
                        categories.map((cat) {
                          return DropdownMenuItem(value: cat, child: Text(cat));
                        }).toList(),
                  ),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: sortBy,
                  onChanged: (value) {
                    setState(() {
                      sortBy = value!;
                    });
                  },
                  items:
                      ['Terbaru', 'Terlama'].map((sort) {
                        return DropdownMenuItem(value: sort, child: Text(sort));
                      }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Kursus
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return InkWell(
                    onTap:
                        () => showModalBottomSheet(
                          context: context,
                          builder:
                              (_) => Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course['title'],
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                    SizedBox(height: 8),
                                    Text("Kategori: ${course['category']}"),
                                    SizedBox(height: 8),
                                    Text("Deskripsi: ${course['description']}"),
                                  ],
                                ),
                              ),
                        ),
                    child: CourseCardWidget(course: course),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            // Badge
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '🏅 Badge Skill Diperoleh',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                children:
                    filteredCourses.map((course) {
                      return BadgeWidget(badgeName: course['badge']);
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
