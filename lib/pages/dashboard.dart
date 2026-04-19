import 'package:flutter/material.dart';
import '../data/beach_data.dart'; // Import data pantai
import 'components/beach_card.dart'; // Import komponen card
import 'detail_popup.dart'; // Import komponen popup

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Fungsi untuk memanggil popup detail
  void _openDetail(BuildContext context, Beach beach) {
    showDialog(
      context: context,
      builder: (context) => BeachDetailPopup(
        name: beach.name,
        rating: beach.rating,
        imgUrl: beach.imgUrl,
        location: beach.location,
        description: beach.description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            _buildSearchBar(),

            // Section Rekomendasi Viral
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rekomendasi Pantai terviral!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Geser untuk informasi lainnya",
                    style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal List (Data dari viralBeaches)
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 25),
                itemCount: viralBeaches.length,
                itemBuilder: (context, index) {
                  final beach = viralBeaches[index];
                  return GestureDetector(
                    onTap: () => _openDetail(context, beach),
                    child: BeachCard(
                      name: beach.name,
                      location: beach.location,
                      imgUrl: beach.imgUrl,
                      isLarge: true,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Section Pantai Umum
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Pantai Umum Seindonesia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Grid View (Data dari generalBeaches)
            Padding(
              padding: const EdgeInsets.all(25),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),
                itemCount: generalBeaches.length,
                itemBuilder: (context, index) {
                  final beach = generalBeaches[index];
                  return GestureDetector(
                    onTap: () => _openDetail(context, beach),
                    child: BeachCard(
                      name: beach.name,
                      location: beach.location,
                      imgUrl: beach.imgUrl,
                      isLarge: false,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // Widget Bagian Header Abu-abu
  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 90, 30, 80), // Sesuaikan padding biar pas
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Placeholder warna asli kalau gambar gagal load
        // --- TAMBAHKAN GAMBAR DI SINI ---
        image: DecorationImage(
          // Ganti URL ini dengan gambar pantai pilihanmu
          image: const NetworkImage("https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?q=80&w=1000"), 
          fit: BoxFit.cover, // Biar gambar nutupin seluruh area tanpa gepeng
          // Overlay gelap tipis biar teks putih di atasnya kebaca
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3), 
            BlendMode.darken,
          ),
        ),
        // -------------------------------
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Selamat Datang",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Menyajikan informasi Pantai indah dan tersembunyi yang bisa anda temukan dengan mudah",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Widget Search Bar
  Widget _buildSearchBar() {
    return Transform.translate(
      offset: const Offset(0, -25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color(0xFFE5D1B2), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Temukan destinasi",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: Icon(Icons.search, color: Color(0xFF74CAE1)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ),
    );
  }
}