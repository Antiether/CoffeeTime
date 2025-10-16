import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget ProfilePage untuk menampilkan profil
/// Halaman ini menampilkan data user dan data author
class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // tab pemisah antara User dan Author
          TabBar(
            tabs: [
              Tab(text: "User Profile"),
              Tab(text: "Author Profile"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // User Profile Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Info",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username: $username",
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Author Profile Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Author Info",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: Faiz Ahmad Nadhif",
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Student Number: 2357051012",
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
