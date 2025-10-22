import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Pribadi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProfilPribadiScreen(),
    );
  }
}

class ProfilPribadiScreen extends StatelessWidget {
  const ProfilPribadiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pribadi App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),

                // --- PERUBAHAN ADA DI SINI ---
                // Foto profil diambil dari link gambar baru yang dicari dari Google.
            const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(// Ganti URL dengan ini untuk tes
                  'https://i.ibb.co/685XN1s/user-icon.png'
              ),
              backgroundColor: Colors.grey,
            ),

                // --- AKHIR PERUBAHAN ---

                const SizedBox(height: 20),

                // Nama Lengkap
                const Text(
                  'Farhan Arya Dwitama',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Info Tempat & Tanggal Lahir
                _buildInfoRow(
                  icon: Icons.cake,
                  text: 'Kotabumi, 21 Januari 2006',
                ),
                const SizedBox(height: 10),

                // Info Hobi
                _buildInfoRow(
                  icon: Icons.sports_esports,
                  text: 'Bermain Game dan Membaca',
                ),
                const SizedBox(height: 25),

                // Deskripsi Singkat Diri
                const Text(
                  '"Pelajar dan pengembang yang memiliki minat kuat pada teknologi, khususnya dalam pembuatan aplikasi mobile menggunakan Flutter."',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Tombol dengan Aksi
                ElevatedButton.icon(
                  icon: const Icon(Icons.touch_app),
                  label: const Text('Hubungi Saya'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    // Aksi saat tombol ditekan
                    debugPrint('Tombol Hubungi Saya ditekan!');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Terima kasih telah melihat profil ini!'),
                        duration: Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget pembantu untuk membuat baris info (Ikon + Teks)
  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue[800]),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
