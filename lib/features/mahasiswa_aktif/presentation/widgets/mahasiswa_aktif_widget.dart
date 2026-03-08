import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_aktif_model.dart';

class ModernMahasiswaAktifCard extends StatefulWidget {
  final MahasiswaAktifModel mahasiswa;

  const ModernMahasiswaAktifCard({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  State<ModernMahasiswaAktifCard> createState() => _State();
}

class _State extends State<ModernMahasiswaAktifCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    _scale = Tween<double>(begin: 1.0, end: 0.97).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = [const Color(0xFFFF758C), const Color(0xFFFF7EB3)]; // Warna Pink

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.pink.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
            border: Border.all(color: Colors.pink.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors),
                  shape: BoxShape.circle,
                ),
                child: Center(child: Text(widget.mahasiswa.nama[0], style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.mahasiswa.nama, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('NIM: ${widget.mahasiswa.nim}', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                    Text('Semester: ${widget.mahasiswa.semester} | ${widget.mahasiswa.jurusan}', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                child: const Text('Aktif', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}