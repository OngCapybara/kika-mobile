import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            // hero section
            Stack(
              alignment: Alignment.center,
              children: [
                // Background Gradasi Biru ke Putih
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFD2F5FF), Colors.white],
                    ),
                  ),
                ),

                // Nama + Foto Profile
                Column(
                  children: [
                    const SizedBox(height: 100),
                    const CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xFFD9D9D9),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Astika',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444444),
                      ),
                    ),
                    const Text(
                      '23316054',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            // Refactor "student of"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 1, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Student Of",
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
                  ),
                  const Expanded(
                    child: Divider(thickness: 1, color: Colors.black54),
                  ),
                ],
              ),
            ),

            // List Informasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  _buildInfoRow(
                    Icons.business,
                    "Universitas Teknokrat Indonesia",
                  ),
                  _buildInfoRow(
                    Icons.school_outlined,
                    "Fakultas Teknik dan Ilmu Komputer",
                  ),
                  _buildInfoRow(Icons.laptop_mac, "Teknik Komputer"),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Tombol Logout
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE5D1B2), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Helper widget biar kode gak berulang
  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 28),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}