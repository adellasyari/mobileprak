// 1. Ini adalah Class Dasar (Induk)
class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

// 2. Class Anak Pertama: MahasiswaAktif (mewarisi Mahasiswa)
class MahasiswaAktif extends Mahasiswa {
  int? semester; // Atribut tambahan khusus untuk mahasiswa aktif

  // Menimpa (override) fungsi induk untuk menambahkan data semester
  @override
  void tampilkanData() {
    super.tampilkanData(); // Memanggil fungsi tampilkanData() dari induk
    print("Status: Mahasiswa Aktif");
    print("Semester: ${semester ?? 'Belum diisi'}");
  }
}

// 3. Class Anak Kedua: MahasiswaAlumni (mewarisi Mahasiswa)
class MahasiswaAlumni extends Mahasiswa {
  int? tahunLulus; // Atribut tambahan khusus untuk alumni

  // Menimpa (override) fungsi induk untuk menambahkan data tahun lulus
  @override
  void tampilkanData() {
    super.tampilkanData(); 
    print("Status: Alumni");
    print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
  }
}

// 4. Menjalankan Program
void main() {
  print("=== DATA MAHASISWA AKTIF ===");
  MahasiswaAktif mhsAktif = MahasiswaAktif();
  mhsAktif.nama = "Adella"; // Mewarisi atribut nama dari induk
  mhsAktif.nim = 2024001;         // Mewarisi atribut nim
  mhsAktif.jurusan = "D4 Teknik Informatika"; // Mewarisi atribut jurusan
  mhsAktif.semester = 4;          // Atribut miliknya sendiri
  mhsAktif.tampilkanData();

  print("\n=== DATA MAHASISWA ALUMNI ===");
  MahasiswaAlumni mhsAlumni = MahasiswaAlumni();
  mhsAlumni.nama = "Ikhsan";
  mhsAlumni.nim = 2020050;
  mhsAlumni.jurusan = "D4 Sistem Informasi";
  mhsAlumni.tahunLulus = 2024;
  mhsAlumni.tampilkanData();
}