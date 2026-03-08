class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String jurusan;
  final int semester;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.semester,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
      semester: json['semester'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'jurusan': jurusan,
      'semester': semester,
    };
  }
}