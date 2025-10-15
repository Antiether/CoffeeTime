import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

// widget utama aplikasi yang bersifat Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // judul aplikasi
      title: 'Coffee Menu App',
      debugShowCheckedModeBanner: false,
      // tema aplikasi menggunakan warna coklat
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      // menentukan login page sebagai halaman pertama yang ditampilkan
      home: LoginPage(),
    );
  }
}