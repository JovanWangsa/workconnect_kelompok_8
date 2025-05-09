import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocalEconomyMapScreen extends StatefulWidget {
  @override
  _LocalEconomyMapScreenState createState() => _LocalEconomyMapScreenState();
}

class _LocalEconomyMapScreenState extends State<LocalEconomyMapScreen> {
  String selectedRegion = 'Semua';
  String selectedIndustry = 'Semua';

  final List<Map<String, dynamic>> areaData = [
    {
      'name': 'Jakarta',
      'latlng': LatLng(-6.2088, 106.8456),
      'industry': 'Teknologi',
      'unemploymentRate': 6.5,
      'averageSalary': 8000000,
    },
    {
      'name': 'Bandung',
      'latlng': LatLng(-6.9147, 107.6098),
      'industry': 'Industri Kreatif',
      'unemploymentRate': 5.1,
      'averageSalary': 6500000,
    },
    {
      'name': 'Surabaya',
      'latlng': LatLng(-7.2575, 112.7521),
      'industry': 'Manufaktur',
      'unemploymentRate': 4.8,
      'averageSalary': 7000000,
    },
  ];

  List<String> get regionList => [
    'Semua',
    ...areaData.map((e) => e['name'] as String).toSet(),
  ];
  List<String> get industryList => [
    'Semua',
    ...areaData.map((e) => e['industry'] as String).toSet(),
  ];

  List<Map<String, dynamic>> get filteredAreas =>
      areaData.where((area) {
        final matchRegion =
            selectedRegion == 'Semua' || area['name'] == selectedRegion;
        final matchIndustry =
            selectedIndustry == 'Semua' || area['industry'] == selectedIndustry;
        return matchRegion && matchIndustry;
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peta Ekonomi Lokal')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedRegion,
                    onChanged:
                        (value) => setState(() => selectedRegion = value!),
                    items:
                        regionList
                            .map(
                              (region) => DropdownMenuItem(
                                value: region,
                                child: Text(region),
                              ),
                            )
                            .toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedIndustry,
                    onChanged:
                        (value) => setState(() => selectedIndustry = value!),
                    items:
                        industryList
                            .map(
                              (industry) => DropdownMenuItem(
                                value: industry,
                                child: Text(industry),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(-6.9147, 107.6098),
                initialZoom: 5.5,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers:
                      filteredAreas.map((area) {
                        return Marker(
                          point: area['latlng'],
                          width: 120,
                          height: 120,
                          child: GestureDetector(
                            onTap:
                                () => showDialog(
                                  context: context,
                                  builder:
                                      (_) => AlertDialog(
                                        title: Text(area['name']),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Industri dominan: ${area['industry']}',
                                            ),
                                            Text(
                                              'Tingkat pengangguran: ${area['unemploymentRate']}%',
                                            ),
                                            Text(
                                              'Gaji rata-rata: Rp ${area['averageSalary']}',
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text('Tutup'),
                                            onPressed:
                                                () => Navigator.pop(context),
                                          ),
                                          TextButton(
                                            child: Text('Detail Wilayah'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (_) => AreaDetailScreen(
                                                        area,
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                ),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AreaDetailScreen extends StatelessWidget {
  final Map<String, dynamic> area;

  AreaDetailScreen(this.area);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Wilayah - ${area['name']}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('🧭 Lokasi: ${area['name']}', style: TextStyle(fontSize: 18)),
            Text(
              '🏭 Industri Dominan: ${area['industry']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '📉 Tingkat Pengangguran: ${area['unemploymentRate']}%',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '💰 Gaji Rata-rata: Rp ${area['averageSalary']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Keterangan tambahan bisa ditambahkan di sini, seperti tren pekerjaan, pelatihan yang tersedia, atau kolaborasi daerah.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
