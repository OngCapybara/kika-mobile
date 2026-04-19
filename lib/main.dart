import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'pages/login.dart';
import 'pages/profile.dart';
import 'pages/register.dart';
import 'pages/components/bottomNavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technokrat Project',
      // font poppins
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Ubah ke 0 supaya yang pertama tampil adalah Dashboard (index ke-0)
  int _currentIndex = 0;

  // List halaman yang dipanggil dari file terpisah
  final List<Widget> _screens = [
    const DashboardPage(), // Halaman Dashboard-mu
    const ProfilePage(), // Halaman Profile yang tadi kita buat
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
