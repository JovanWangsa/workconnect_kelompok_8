import 'package:flutter/material.dart';

class WorkReportScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {
      'tanggal': '2025-05-01',
      'aktivitas': 'Menyelesaikan tugas desain UI',
      'status': 'Selesai',
    },
    {
      'tanggal': '2025-05-02',
      'aktivitas': 'Meeting tim pengembangan',
      'status': 'Dalam Proses',
    },
    {
      'tanggal': '2025-05-03',
      'aktivitas': 'Upload file ke sistem',
      'status': 'Selesai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Laporan Kerja')),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.work),
              title: Text(report['aktivitas']!),
              subtitle: Text('Tanggal: ${report['tanggal']}'),
              trailing: Chip(
                label: Text(
                  report['status']!,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor:
                    report['status'] == 'Selesai'
                        ? Colors.green
                        : Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}
