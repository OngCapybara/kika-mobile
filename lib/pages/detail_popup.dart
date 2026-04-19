import 'package:flutter/material.dart';

class BeachDetailPopup extends StatelessWidget {
  final String name, rating, location, description, imgUrl;

  const BeachDetailPopup({
    super.key, required this.name, required this.rating, 
    required this.location, required this.description, required this.imgUrl
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFFE5D1B2), width: 2),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 5),
                      Text(rating, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                height: 180,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  const Icon(Icons.push_pin_outlined, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(child: Text(location, style: const TextStyle(fontSize: 11, color: Colors.grey, fontStyle: FontStyle.italic))),
                ]),
              ),
              const Padding(padding: EdgeInsets.all(15), child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(description, style: const TextStyle(fontSize: 12, height: 1.5, color: Colors.black87)),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE5D1B2)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("See Location Here", style: TextStyle(color: Color(0xFF74CAE1))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}