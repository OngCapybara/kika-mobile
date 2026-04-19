import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // Backend URL (Sesuaikan jika pakai emulator atau device asli)
  static const String _baseUrl = 'http://localhost:3000';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // --- LOGIKA BACKEND UTAMA ---
  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text.trim(),
          'password': _passwordController.text,
        }),
      );
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (!mounted) return;
      if (response.statusCode == 200) {
        final user = body['user'] as Map<String, dynamic>?;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil. Selamat datang ${user?['name'] ?? ''}'), backgroundColor: Colors.green),
        );
        // Arahkan ke MainScreen (Dashboard) setelah login
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(body['message']?.toString() ?? 'Login gagal'), backgroundColor: Colors.red),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak bisa terhubung ke server backend'), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F7FA), Colors.white, Color(0xFFF5E6D3)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 1. LOGO DARI ASET
                    Image.asset(
                      'assets/images/logo.jpeg', 
                      height: 120,
                    ),
                    const SizedBox(height: 20),

                    // 2. WELCOME TEXT
                    const Text(
                      'Welcome to My App',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF555555)),
                    ),
                    const Text(
                      'Hidden Gem Pantai',
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                    const SizedBox(height: 40),

                    // 3. EMAIL INPUT
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      ),
                      validator: (value) => (value == null || !value.contains('@')) ? 'Format email salah' : null,
                    ),
                    const SizedBox(height: 20),

                    // 4. PASSWORD INPUT
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      ),
                      validator: (value) => (value == null || value.isEmpty) ? 'Password wajib diisi' : null,
                    ),
                    const SizedBox(height: 10),

                    // 5. REMEMBER ME & FORGET PASSWORD
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 24, width: 24,
                              child: Checkbox(value: false, onChanged: (v) {}),
                            ),
                            const Text(" Remember me", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {}, // Dummy
                          child: const Text("Forget password?", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // 6. SIGN IN BUTTON
                    SizedBox(
                      width: 180,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6D6D6D),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: _isLoading 
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                          : const Text('Sign in', style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // 7. OR DIVIDER
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("or", style: TextStyle(color: Colors.grey[600])),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 8. GOOGLE SIGN IN (DUMMY)
                    GestureDetector(
                      onTap: () {}, // Dummy, gak butuh fungsi
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg', 
                            height: 20,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.g_mobiledata, size: 30),
                          ),
                          const SizedBox(width: 10),
                          const Text("Sign in with Google", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // 9. CREATE ACCOUNT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New user? ", style: TextStyle(color: Colors.grey)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterPage()));
                          },
                          child: const Text(
                            "Create Account", 
                            style: TextStyle(color: Color(0xFF74CAE1), fontWeight: FontWeight.bold)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}