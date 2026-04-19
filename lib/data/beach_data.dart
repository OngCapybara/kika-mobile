class Beach {
  final String name;
  final String location;
  final String imgUrl;
  final String rating;
  final String description;

  Beach({
    required this.name,
    required this.location,
    required this.imgUrl,
    required this.rating,
    required this.description,
  });
}

// Data Pantai Viral (Horizontal)
final List<Beach> viralBeaches = [
  Beach(
    name: "Mandiri Beach",
    location: "Krui - Pesisir Barat",
    rating: "4.8",
    imgUrl: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400",
    description: "Destinasi selancar terkenal di Lampung dengan ombak konsisten dan sunset memukau.",
  ),
  Beach(
    name: "Pantai Gigi Hiu",
    location: "Kelumbayan - Lampung",
    rating: "4.9",
    imgUrl: "https://images.unsplash.com/photo-1519046904182-f263690d15e6?w=400",
    description: "Terkenal dengan jajaran batu karang tajam yang menyerupai gigi hiu di tepi pantai.",
  ),
  Beach(
    name: "Pulau Pahawang",
    location: "Pesawaran - Lampung",
    rating: "4.7",
    imgUrl: "https://images.unsplash.com/photo-1506953823976-52e1bdc0149a?w=400",
    description: "Surga snorkeling dengan air jernih dan keanekaragaman hayati bawah laut yang kaya.",
  ),
  Beach(
    name: "Pantai Sari Ringgit",
    location: "Pesawaran - Lampung",
    rating: "4.6",
    imgUrl: "https://images.unsplash.com/photo-1520942702018-0862200e6873?w=400",
    description: "Pantai dengan pasir putih halus dan air tenang, cocok untuk wisata keluarga.",
  ),
];

// Data Pantai Umum (Grid 2x4)
final List<Beach> generalBeaches = [
  Beach(name: "Pantai Ora", location: "Maluku", rating: "4.8", imgUrl: "https://images.unsplash.com/photo-1471922694854-ff1b63b20054?w=200", description: "..."),
  Beach(name: "Nihiwatu", location: "Sumba", rating: "4.9", imgUrl: "https://images.unsplash.com/photo-1505118380757-91f5f45d8de4?w=200", description: "..."),
  Beach(name: "Tanjung Tinggi", location: "Belitung", rating: "4.7", imgUrl: "https://images.unsplash.com/photo-1515238152791-8216bfdf89a7?w=200", description: "..."),
  Beach(name: "Pantai Pink", location: "Pulau Padar", rating: "4.8", imgUrl: "https://images.unsplash.com/photo-1509233725247-49e657c54213?w=200", description: "..."),
  Beach(name: "Pantai Papuma", location: "Jember", rating: "4.6", imgUrl: "https://images.unsplash.com/photo-1510172951991-856a654063f9?w=200", description: "..."),
  Beach(name: "Gili Trawangan", location: "Lombok", rating: "4.7", imgUrl: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=200", description: "..."),
  Beach(name: "Ngurtafur", location: "Maluku Tenggara", rating: "4.9", imgUrl: "https://images.unsplash.com/photo-1544550581-5f7ceaf7f992?w=200", description: "..."),
  Beach(name: "Kelingking", location: "Nusa Penida", rating: "4.9", imgUrl: "https://images.unsplash.com/photo-1534067783941-51c9c23ecefd?w=200", description: "..."),
];