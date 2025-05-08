import 'package:flutter/material.dart';
import 'job_search_screen.dart';
import 'profile_screen.dart';
import '../screens/riwayat/course_history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkConnect'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Belum ada notifikasi')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuItem(context, Icons.search, "Cari Pekerjaan"),
            _buildMenuItem(context, Icons.person, "Profil & CV"),
            _buildMenuItem(context, Icons.school, "Kursus & Sertifikat"),
            _buildMenuItem(context, Icons.map, "Peta Ekonomi"),
            _buildMenuItem(context, Icons.report, "Laporan Kerja"),
            _buildMenuItem(context, Icons.bookmark, "Bookmark"),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Cari Pekerjaan") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => JobSearchScreen()),
          );
        }
        if (title == "Profil & CV") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProfileScreen()),
          );
        }
        if (title == "Kursus & Sertifikat") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CourseHistoryScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigasi ke $title (siap diimplementasi)')),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue[900]),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
