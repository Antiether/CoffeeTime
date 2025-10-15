import 'package:flutter/material.dart';
import 'dashboard_page.dart';

/// Widget LoginPage sebagai halaman awal aplikasi
/// Halaman ini berfungsi untuk input username sebelum masuk ke menu utama
class LoginPage extends StatelessWidget {
  // controller untuk handle input text
  final TextEditingController usernameController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background coklat
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.coffee, size: 100, color: Colors.brown[400]),
              SizedBox(height: 20),

              // judul aplikasi
              Text(
                "Welcome to CoffeeTime ☕",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // input field
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // jarak antar input field dan tombol login
              SizedBox(height: 20),

              // tombol login
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  if (username.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(username: username),
                      ),
                    );
                  }
                },

                // styling tombol
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}