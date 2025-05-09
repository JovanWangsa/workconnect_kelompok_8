import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  final List<Map<String, String>> bookmarkedItems = [
    {
      'title': 'Frontend Developer',
      'company': 'Tech Corp',
      'location': 'Jakarta',
    },
    {
      'title': 'UI/UX Designer',
      'company': 'Design Studio',
      'location': 'Bandung',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
        backgroundColor: Colors.blue[700],
      ),
      body:
          bookmarkedItems.isEmpty
              ? Center(child: Text('Belum ada bookmark.'))
              : ListView.builder(
                itemCount: bookmarkedItems.length,
                itemBuilder: (context, index) {
                  final item = bookmarkedItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(item['title']!),
                      subtitle: Text(
                        '${item['company']} • ${item['location']}',
                      ),
                      trailing: Icon(Icons.bookmark, color: Colors.blue),
                      onTap: () {
                        // Arahkan ke detail pekerjaan (jika ada)
                      },
                    ),
                  );
                },
              ),
    );
  }
}
