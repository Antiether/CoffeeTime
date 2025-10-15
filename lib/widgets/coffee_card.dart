import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget CoffeCard untuk menampilkan informasi menu kopi dalam bentuk card
/// Widget ini dapat diklik, dan dapat menampilkan informasi
class CoffeeCard extends StatelessWidget {
  // Data kopi yang berisi informasi
  final Map<String, dynamic> coffee;
  // callback function
  final VoidCallback onTap;

  /// Constructor untuk inisialisasi data
  /// Parameter required memastikan dua nilai harus diisi saat membuat instance
  const CoffeeCard({super.key, required this.coffee, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // GestureDetector untuk mendeteksi tap/klik pada card
    return GestureDetector(
      onTap: onTap, // memanggil callback function saat card diklik
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        // styling container
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(16),
        ),
        // layout horizontal menggunakan Row
        child: Row(
          children: [
            // ClipRect untuk membuat gambar dengan sudut lengkung
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                coffee["image"], // Path gambar dari data coffee
                width: 80,
                height: 80,
                fit: BoxFit.cover, // Gambar mengisi area tanpa distorsi
              ),
            ),
            SizedBox(width: 12),
            // expanded agar kolom teks mengisi sisa ruang yang tersedia
            Expanded(
              child: Column(
                // alignment teks dimulai dari kiri
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // informasi kopi
                  Text(coffee["name"],
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(coffee["desc"],
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.brown)),
                  SizedBox(height: 4),
                  Text(coffee["price"],
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.brown[700])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}