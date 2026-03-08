import '../models/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfileData() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulasi loading

    return ProfileModel(
      nama: 'Admin D4TI',
      email: 'admin.d4ti@vokasi.edu',
      role: 'Administrator Sistem',
      instansi: 'Universitas Airlangga',
    );
  }
}