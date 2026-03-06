// --- 1. MEMBUAT 3 MIXIN (Kemampuan Tambahan) ---
mixin Penelitian {
  void lakukanPenelitian() {
    print("- Aktif melakukan riset dan publikasi jurnal.");
  }
}

mixin Pengabdian {
  void lakukanPengabdian() {
    print("- Aktif melakukan pengabdian kepada masyarakat.");
  }
}

mixin Organisasi {
  void ikutOrganisasi() {
    print("- Aktif dalam struktur organisasi kampus.");
  }
}

// --- 2. CLASS DASAR (Sesuai instruksi modul) ---
class Mahasiswa {
  String? nama;
  
  void infoDasar() {
    print("Nama: ${nama ?? 'Belum diisi'}");
  }
}

// --- 3. CLASS TURUNAN YANG MENGGUNAKAN MIXIN ---

// Class Dosen meng-extends Mahasiswa dan menempelkan 2 Mixin (Penelitian & Pengabdian)
class Dosen extends Mahasiswa with Penelitian, Pengabdian {
  String? nidn;

  void infoDosen() {
    print("=== DATA DOSEN ===");
    infoDasar(); // Memanggil nama dari class Mahasiswa
    print("NIDN: ${nidn ?? 'Belum diisi'}");
    lakukanPenelitian(); // Memanggil kemampuan dari Mixin Penelitian
    lakukanPengabdian(); // Memanggil kemampuan dari Mixin Pengabdian
  }
}

// Class Fakultas meng-extends Mahasiswa dan menempelkan 1 Mixin (Organisasi)
class Fakultas extends Mahasiswa with Organisasi {
  String? namaFakultas;

  void infoFakultas() {
    print("\n=== DATA FAKULTAS ===");
    infoDasar(); // Memanggil nama dari class Mahasiswa (Bisa dianggap sebagai nama Dekan/Ketua)
    print("Fakultas: ${namaFakultas ?? 'Belum diisi'}");
    ikutOrganisasi(); // Memanggil kemampuan dari Mixin Organisasi
  }
}

// --- 4. MENJALANKAN PROGRAM ---
void main() {
  // Membuat objek Dosen
  Dosen dosen1 = Dosen();
  dosen1.nama = "Dr. Ikhsan M.Kom"; // Atribut warisan dari Mahasiswa
  dosen1.nidn = "04123456";
  dosen1.infoDosen();

  // Membuat objek Fakultas
  Fakultas fakultas1 = Fakultas();
  fakultas1.nama = "Prof. Fahril M.T"; // Atribut warisan dari Mahasiswa
  fakultas1.namaFakultas = "Fakultas Vokasi";
  fakultas1.infoFakultas();
}