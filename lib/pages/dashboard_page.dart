import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coffee_detail_page.dart';
import 'profile_page.dart';
import '../widgets/coffee_card.dart';

/// widget dashboard page sebagai halaman utama aplikasi
class DashboardPage extends StatefulWidget {
  /// username yang diterima dari login page
  final String username;
  DashboardPage({super.key, required this.username});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// list data menu minuman dengan detail informasi
  /// setiap item berisi: nama, deskripsi, harga, gambar, dan kategori
  final List<Map<String, dynamic>> coffeeMenu = [
    {
      "name": "Espresso",
      "desc": "Ekstrak kopi murni yang pekat dengan lapisan crema keemasan di atasnya.",
      "price": "Rp 15.000",
      "image": "assets/images/espresso.jpeg",
      "category": "coffee"
    },
    {
      "name": "Americano",
      "desc": "Sajian espresso yang ditambah air panas untuk rasa kopi hitam yang lebih ringan.",
      "price": "Rp 20.000",
      "image": "assets/images/americano.jpeg",
      "category": "coffee"
    },
    {
      "name": "Long Black",
      "desc": "Kopi hitam kaya rasa yang dibuat dengan menuang espresso di atas air panas.",
      "price": "Rp 20.000",
      "image": "assets/images/long_black.jpeg",
      "category": "coffee"
    },
    {
      "name": "Cold Brew",
      "desc": "Kopi seduh dingin selama belasan jam, menghasilkan karakter rasa yang halus dan rendah asam.",
      "price": "Rp 22.000",
      "image": "assets/images/coldbrew.jpeg",
      "category": "coffee"
    },
    {
      "name": "Caffe Latte",
      "desc": "Perpaduan lembut antara espresso dan susu steamed yang creamy.",
      "price": "Rp 27.000",
      "image": "assets/images/caffe_latte.jpeg",
      "category": "coffee"
    },
    {
      "name": "Moccha",
      "desc": "Kombinasi nikmat dari espresso, susu, dan cokelat untuk sensasi rasa yang mewah.",
      "price": "Rp 27.000",
      "image": "assets/images/moccha.jpeg",
      "category": "coffee"
    },
    {
      "name": "Cappucino",
      "desc": "Keseimbangan sempurna antara espresso, susu panas, dan busa susu yang tebal.",
      "price": "Rp 27.000",
      "image": "assets/images/cappucino.jpeg",
      "category": "coffee"
    },
    {
      "name": "Macchiato",
      "desc": "Satu shot espresso yang ditandai dengan sedikit busa susu untuk sentuhan rasa.",
      "price": "Rp 27.000",
      "image": "assets/images/macchiato.jpeg",
      "category": "coffee"
    },
    {
      "name": "Matcha",
      "desc": "Teh hijau bubuk premium dari Jepang yang disajikan kental dan kaya rasa.",
      "price": "Rp 25.000",
      "image": "assets/images/matcha.jpeg",
      "category": "non-coffee"
    },
    {
      "name": "Matcha Latte",
      "desc": "Campuran teh hijau matcha yang khas dengan kelembutan susu steamed yang creamy.",
      "price": "Rp 30.000",
      "image": "assets/images/matcha_latte.jpeg",
      "category": "non-coffee"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // filter menu berdasarkan kategori 'coffee'
    final coffeeItems = coffeeMenu.where((item) => item['category'] == 'coffee').toList();
    // filter menu berdasarkan kategori 'non-coffee'
    final nonCoffeeItems = coffeeMenu.where((item) => item['category'] == 'non-coffee').toList();

    // List of widgets for IndexedStack
    List<Widget> _widgetOptions = <Widget>[
      // Home tab
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // greeting text dengan username yang dipersonalisasi
            Text(
              "Hi, ${widget.username} 👋, hari ini mau pesen apa nih? 😄",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // ListView dengan scrolling untuk menampilkan semua menu
            Expanded(
              child: ListView(
                children: [
                  // Section Coffee
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "COFFEE",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                  ),

                  // loop untuk menampilkan semua item coffee menggunakan spread operator
                  ...coffeeItems.map((coffee) {
                    return CoffeeCard(
                      coffee: coffee,
                      // Callback onTap untuk navigasi ke halaman detail
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoffeeDetailPage(coffee: coffee),
                          ),
                        );
                      },
                    );
                  }),

                  SizedBox(height: 20),

                  // Section Non-Coffee
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "NON-COFFEE",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                  ),

                  // loop untuk menampilkan semua item non-coffee
                  ...nonCoffeeItems.map((coffee) {
                    return CoffeeCard(
                      coffee: coffee,
                      // Callback onTap untuk navigasi ke halaman detail
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoffeeDetailPage(coffee: coffee),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      // Profile tab
      ProfilePage(username: widget.username),
    ];

    // AppBar dengan judul dan tombol logout
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Menu"),
        backgroundColor: Colors.brown,
        actions: [
          // tombol logout untuk kembali ke halaman login
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      // bottom navigation untuk menunjukkan halaman dashboard dan profile
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
      ),
    );
  }
}