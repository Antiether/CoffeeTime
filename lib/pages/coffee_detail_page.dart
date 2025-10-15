import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget CoffeDetailPage untuk menampilkan informasi lengkap menu kopi
/// Halaman ini menampilkan gambar besar, nama, deskripsi, harga, dan tombol add to cart
class CoffeeDetailPage extends StatelessWidget {
  final Map<String, dynamic> coffee;

  const CoffeeDetailPage({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffee["name"]),
        backgroundColor: Colors.brown,
      ),
      // center widget untuk menempatkan konten di tengah layar
      body: Center(
        // SingleChildScrollView agar konten bisa di scroll jika layar kecil
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mengatur konten agar ada di tengah baik secara vertikal maupun horizontal
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    coffee["image"],
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover, // gambar mengisi area tanpa distorsi
                  ),
                ),
                SizedBox(height: 20),
                // informasi kopi dengan pengaturan style teks nya
                Text(
                  coffee["name"],
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  coffee["desc"],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                SizedBox(height: 20),
                Text(
                  coffee["price"],
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown[700]),
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    // menampilkan SnackBar sebagai feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${coffee["name"]} ditambahkan ke keranjang!')),
                    );
                  },
                  icon: Icon(Icons.shopping_cart), // icon keranjang
                  label: Text("Tambah ke Keranjang"), // label teks tombol
                  // style tombol dengan warna coklat
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}