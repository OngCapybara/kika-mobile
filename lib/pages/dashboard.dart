import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(30, 80, 30, 60),
              color: const Color(0xFFD9D9D9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF444444),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Menyajikan informasi Pantai indah dan tersembunyi yang bisa anda temukan dengan mudah",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            // 2. Search Bar
            Transform.translate(
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
            ),

            // 3. Section Rekomendasi (Horizontal)
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

            // 4. Horizontal ListView (4 Items)
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 25),
                children: [
                  _buildBeachCard("Mandiri Beach", "Krui - Pesisir Barat", "4.8", "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400"),
                  _buildBeachCard("Pantai Gigi Hiu", "Kelumbayan - Tanggamus", "4.9", "https://images.unsplash.com/photo-1519046904182-f263690d15e6?w=400"),
                  _buildBeachCard("Pulau Pahawang", "Pesawaran - Lampung", "4.7", "https://images.unsplash.com/photo-1506953823976-52e1bdc0149a?w=400"),
                  _buildBeachCard("Pantai Sari Ringgit", "Pesawaran", "4.6", "https://images.unsplash.com/photo-1520942702018-0862200e6873?w=400"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 5. Section Pantai Umum (Grid 2x4)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Pantai Umum Seindonesia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

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
                itemCount: 8, // 2x4 = 8 item
                itemBuilder: (context, index) {
                  return _buildGeneralBeachCard(
                    "Pantai ${index + 1}", 
                    "Lokasi Indonesia",
                    "https://images.unsplash.com/photo-1471922694854-ff1b63b20054?w=200",
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

  // Helper Card Viral (Horizontal)
  Widget _buildBeachCard(String name, String location, String rating, String imgUrl) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE5D1B2), width: 1.5),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                  ],
                ),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                Text(location, style: const TextStyle(fontSize: 10, color: Colors.white70, fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Card Grid (Bawah)
  Widget _buildGeneralBeachCard(String name, String location, String imgUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE5D1B2), width: 1),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
            Text(location, style: const TextStyle(fontSize: 10, color: Colors.white70, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}