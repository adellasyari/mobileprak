import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay (loading)
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa
    return [
      MahasiswaModel(
        nama: 'Adella Putri Asyari',
        nim: '21001001',
        email: 'adella.putri.asyari@student.com',
        jurusan: 'D4 Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Alifia Putri Marizka',
        nim: '21001002',
        email: 'alifia.putri.marizka@student.com',
        jurusan: 'D4 Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Arviansyah',
        nim: '21001003',
        email: 'arviansyah@student.com',
        jurusan: 'D4 Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Reta Hadiana',
        nim: '21001004',
        email: 'reta.hadiana@student.com',
        jurusan: 'D4 Teknik Informatika',
      ),
    ];
  }
}