import 'package:flutter/material.dart';

class BeachCard extends StatelessWidget {
  final String name;
  final String location;
  final String imgUrl;
  final bool isLarge; // true buat list horizontal, false buat grid bawah

  const BeachCard({
    super.key,
    required this.name,
    required this.location,
    required this.imgUrl,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isLarge ? 200 : null, // Kalau horizontal, kasih lebar tetap
      margin: isLarge ? const EdgeInsets.only(right: 15) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE5D1B2), width: 1.5),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Love (Hanya muncul kalau card besar/viral)
            if (isLarge)
              const Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite_border, color: Colors.white, size: 20),
                ),
              ),
            
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              location,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}