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
    location: "Mandiri, Krui - Pesisir Barat",
    rating: "4.8",
    imgUrl:
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400",
    description:
        "Destinasi selancar terkenal di Lampung dengan ombak konsisten dan sunset memukau.",
  ),
  Beach(
    name: "Selong Belanak Beach",
    location: "Praya Barat - Lombok",
    rating: "4.9",
    imgUrl: "assets/images/belanak.jpeg",
    description:
        "Pantai Selong Belanak di Lombok Selatan adalah surga tropis berpasir putih halus yang melengkung seperti bulan sabit, dikelilingi perbukitan hijau. Terkenal dengan air laut biru jernih, pantai ini landai dan ideal untuk pemula yang ingin berselancar, bermain kano, atau menikmati matahari terbenam yang memukau",
  ),
  Beach(
    name: "Diamond Beach",
    location: "Pejukutan, Nusa Penida, Klungkung Regency - Bali",
    rating: "4.7",
    imgUrl: "assets/images/diamond.jpeg",
    description:
        "Diamond Beach di Nusa Penida, Bali, adalah pantai surga tersembunyi yang terkenal dengan tebing kapur putih berbentuk runcing seperti berlian (diamond), pasir putih halus, dan air laut biru toska yang jernih. Destinasi ini menawarkan panorama dramatis yang diakses melalui tangga di tebing, menjadikannya salah satu spot foto terpopuler di Bali. ",
  ),
  Beach(
    name: "Koka Beach",
    location: "Paga, Kabupaten Sikka, Pulau Flores - NTT",
    rating: "4.6",
    imgUrl: "koka.jpeg",
    description:
        "Pantai Koka (Koka Beach) adalah permata tersembunyi di Kecamatan Paga, Kabupaten Sikka, Flores, NTT, yang dijuluki 'The Dream Beach'. Pantai ini menawarkan hamparan pasir putih halus, air laut jernih bergradasi biru-hijau, serta diapit oleh dua bukit, yaitu Bukit Rodja dan Bukit Ndate Sare, memberikan pemandangan alam yang asri dan tenang.",
  ),
];

// Data Pantai Umum (Grid 2x4)
final List<Beach> generalBeaches = [
  Beach(
    name: "Atuh Beach",
    location: "Nusa Penida, Kabupaten Klungkung - Bali",
    rating: "4.8",
    imgUrl: "assets/images/atuh.jpeg",
    description:
        "Atuh Beach adalah permata tersembunyi di pesisir timur Nusa Penida, Bali, yang menawarkan pemandangan tebing kapur dramatis, pasir putih halus, dan air laut biru jernih. Pantai ini sering disebut 'Raja Ampat-nya Nusa Penida' karena dikelilingi gugusan pulau-pulau kecil karang yang menawan.",
  ),
  Beach(
    name: "Belanak Beach",
    location: "Praya Barat, Lombok Tengah - NTB",
    rating: "4.9",
    imgUrl: "assets/images/belanak.jpeg",
    description:
        "Pantai Selong Belanak di Lombok Tengah adalah destinasi populer dengan pasir putih yang sangat halus dan garis pantai melengkung seperti bulan sabit. Terkenal dengan ombaknya yang tenang namun cocok untuk surfing pemula, pantai ini menawarkan pemandangan indah, air jernih, dan spot sunset menakjubkan",
  ),
  Beach(
    name: "Maratua Beach",
    location: "Maratua, Kabupaten Berau - Kalimantan Timur",
    rating: "4.7",
    imgUrl: "assets/images/maratua.jpeg",
    description:
        "Pulau Maratua di Berau, Kalimantan Timur, adalah surga tropis yang dijuluki 'Maldives-nya Indonesia' dengan pasir putih halus dan air laut biru jernih. Terkenal sebagai spot diving/snorkeling kelas dunia, pulau berbentuk U ini menawarkan ekosistem bawah laut yang kaya, terumbu karang, penyu, serta deretan resort di atas air yang memukau.",
  ),
  Beach(
    name: "Ngurtafur Beach",
    location: "Warbal, Kei Kecil Barat - Maluku Tenggara",
    rating: "4.8",
    imgUrl: "assets/images/ngurtafur.jpeg",
    description:
        "Pantai Ngurtafur di Kepulauan Kei, Maluku Tenggara, adalah destinasi eksotis terkenal dengan hamparan pasir putih memanjang sejauh 2 km yang menjorok ke tengah laut. Sering disebut 'Pasir Timbul' atau 'Pulau Ular', tempat ini menawarkan pemandangan menakjubkan dengan laut jernih di kedua sisinya saat air surut.",
  ),
  Beach(
    name: "Nihiwatu Beach",
    location: "Sumba Barat - NTT",
    rating: "4.6",
    imgUrl: "assets/images/Nihiwatu.jpeg",
    description:
        "Pantai Nihiwatu di Sumba Barat adalah destinasi eksklusif yang pernah dinobatkan sebagai salah satu pantai terbaik di dunia. Terkenal dengan pasir putih halus, suasana tenang, serta ombak legendaris 'God's Left' yang menjadi favorit peselancar internasional. Pantai ini menyatu dengan resor mewah Nihi Sumba yang memadukan kemewahan modern dengan budaya lokal Sumba yang kental.",
  ),
  Beach(
    name: "Tanjung Penyu Beach",
    location: "Sitiarjo, Sumbermanjing Wetan, Malang - Jatim",
    rating: "4.7",
    imgUrl: "assets/images/TanjungPenyu.jpeg",
    description:
        "Pantai Tanjung Penyu (Mas) adalah destinasi wisata 'hidden gem' baru di Malang Selatan, tepatnya di Sumbermanjing Wetan. Pantai ini menawarkan suasana tenang, bersih, dan pemandangan matahari terbenam (sunset) yang sangat indah. Dengan tiket masuk terjangkau (sekitar Rp10.000), tempat ini populer untuk berkemah (camping) dan bersantai.",
  ),
  Beach(
    name: "Pink Beach",
    location: "Taman Nasional Komodo, Desa Sekaroh",
    rating: "4.9",
    imgUrl: "assets/images/pink.jpeg",
    description:
        "Pink Beach (terutama di Pulau Komodo) adalah destinasi unik dengan pasir berwarna merah muda alami hasil campuran butiran pasir putih dan serpihan karang merah dari foraminifera. Terkenal dengan air laut jernih berwarna toska, pantai ini menawarkan pemandangan menakjubkan, sangat cocok untuk snorkeling, dan merupakan salah satu pantai langka di dunia.",
  ),
  Beach(
    name: "Virgin Beach",
    location: "Manggis, Karangasem - Bali",
    rating: "4.9",
    imgUrl: "assets/images/virgin.jpeg",
    description:
        "Virgin Beach (atau Pantai Pasir Putih) di Karangasem, Bali Timur, adalah surga tersembunyi yang menawarkan suasana tenang dan alami, jauh dari hiruk-pikuk Bali Selatan. Pantai ini terkenal dengan pasir putih halus, air laut biru jernih yang diapit dua bukit, serta ombak yang cocok untuk berenang dan snorkeling.",
  ),
];
