import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Akun")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Nama Depan", _firstNameController),
              buildTextField("Nama Belakang", _lastNameController),
              buildTextField(
                "Usia",
                _ageController,
                inputType: TextInputType.number,
              ),
              buildTextField("Jenis Kelamin", _genderController),
              buildTextField("Alamat", _addressController),
              buildTextField("Username", _usernameController),
              buildTextField("Password", _passwordController, obscure: true),
              buildTextField(
                "Konfirmasi Password",
                _confirmPasswordController,
                obscure: true,
              ),
              CheckboxListTile(
                title: Text("Saya menyetujui syarat dan ketentuan."),
                value: _agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    _agreeToTerms = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agreeToTerms) {
                    // Simulasi pendaftaran berhasil
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Pendaftaran berhasil")),
                    );
                    Navigator.pop(context); // Kembali ke login
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Harap isi semua kolom dan setujui persyaratan",
                        ),
                      ),
                    );
                  }
                },
                child: Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller, {
    bool obscure = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator:
            (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
      ),
    );
  }
}
