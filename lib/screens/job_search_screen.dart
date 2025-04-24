import 'package:flutter/material.dart';

class JobSearchScreen extends StatefulWidget {
  const JobSearchScreen({super.key});

  @override
  State<JobSearchScreen> createState() => _JobSearchScreenState();
}

class _JobSearchScreenState extends State<JobSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Semua';
  String _selectedLocation = 'Jakarta';

  List<Map<String, String>> dummyJobs = [
    {
      'title': 'Frontend Developer',
      'location': 'Jakarta',
      'category': 'Teknologi',
    },
    {
      'title': 'UI/UX Designer',
      'company': 'TechCorp',
      'location': 'Jakarta',
      'type': 'Remote',
    },
    {
      'title': 'Web Developer',
      'company': 'CodeLabs',
      'location': 'Bandung',
      'type': 'Onsite',
    },
    {
      'title': 'Digital Marketing',
      'company': 'Marketify',
      'location': 'Surabaya',
      'type': 'Freelance',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredJobs =
        dummyJobs.where((job) {
          final matchesKeyword = job['title']!.toLowerCase().contains(
            _searchController.text.toLowerCase(),
          );
          final matchesLocation = job['location'] == _selectedLocation;
          final matchesCategory =
              _selectedCategory == 'Semua' ||
              job['category'] == _selectedCategory;

          return matchesKeyword && matchesLocation && matchesCategory;
        }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Cari Lowongan Kerja')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari berdasarkan kata kunci...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 12),

            // Filter lokasi
            DropdownButtonFormField<String>(
              value: _selectedLocation,
              decoration: InputDecoration(
                labelText: 'Lokasi',
                border: OutlineInputBorder(),
              ),
              items:
                  ['Semua', 'Jakarta', 'Bandung', 'Surabaya']
                      .map(
                        (loc) => DropdownMenuItem(child: Text(loc), value: loc),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value!;
                });
              },
            ),
            SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Kategori Pekerjaan',
                border: OutlineInputBorder(),
              ),
              items:
                  ['Semua', 'Teknologi', 'Desain', 'Marketing']
                      .map(
                        (cat) => DropdownMenuItem(child: Text(cat), value: cat),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 16),

            // List hasil lowongan
            Expanded(
              child:
                  filteredJobs.isEmpty
                      ? Center(child: Text('Tidak ada hasil.'))
                      : ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          final job = filteredJobs[index];
                          return Card(
                            child: ListTile(
                              title: Text(job['title']!),
                              subtitle: Text(
                                '${job['company']} • ${job['location']} • ${job['type']}',
                              ),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Detail pekerjaan: ${job['title']}',
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
