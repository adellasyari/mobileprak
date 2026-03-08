class ProfileModel {
  final String nama;
  final String email;
  final String role;
  final String instansi;

  ProfileModel({
    required this.nama,
    required this.email,
    required this.role,
    required this.instansi,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      instansi: json['instansi'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'role': role,
      'instansi': instansi,
    };
  }
}