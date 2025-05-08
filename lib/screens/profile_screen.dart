import 'package:flutter/material.dart';
import 'dart:io'; // Untuk image simulation

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'John Doe',
  );
  final TextEditingController _usernameController = TextEditingController(
    text: 'johndoe99',
  );
  final TextEditingController _ageController = TextEditingController(
    text: '22',
  );
  final TextEditingController _genderController = TextEditingController(
    text: 'Laki-laki',
  );
  final TextEditingController _addressController = TextEditingController(
    text: 'Jakarta, Indonesia',
  );
  final TextEditingController _cvController = TextEditingController(
    text: 'CV_john_doe.pdf',
  );

  File? _profilePhoto; // Simulasi file foto (tidak digunakan nyata)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil & CV Digital')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  _profilePhoto != null
                      ? FileImage(_profilePhoto!)
                      : AssetImage('assets/images/default_profile.png')
                          as ImageProvider,
            ),
            TextButton(
              onPressed: () {
                // Simulasi upload foto
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Simulasi: Upload foto profil")),
                );
              },
              child: Text('Ubah Foto'),
            ),
            buildTextField("Nama Lengkap", _nameController),
            buildTextField("Username", _usernameController),
            buildTextField(
              "Usia",
              _ageController,
              inputType: TextInputType.number,
            ),
            buildTextField("Jenis Kelamin", _genderController),
            buildTextField("Alamat", _addressController),
            buildTextField("Nama File CV", _cvController),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Simulasi: Upload CV")));
              },
              child: Text('Upload CV'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Perubahan profil disimpan (simulasi)"),
                  ),
                );
              },
              child: Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
