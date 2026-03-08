import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulasi loading

    return [
      MahasiswaAktifModel(nama: 'Adella Putri', nim: '21001002', jurusan: 'D4 Teknik Informatika', semester: 4),
      MahasiswaAktifModel(nama: 'Alifia Putri', nim: '21001003', jurusan: 'D4 Teknik Informatika', semester: 6),
      MahasiswaAktifModel(nama: 'Reta Putri', nim: '21001004', jurusan: 'D4 Teknik Informatika', semester: 2),
    ];
  }
}