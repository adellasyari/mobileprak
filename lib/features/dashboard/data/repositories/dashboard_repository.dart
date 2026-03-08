import '../models/dashboard_model.dart';

class DashboardRepository {
  // Mendapatkan data dashboard
  Future<DashboardData> getDashboardData() async {
    // Simulasi delay jaringan (loading)
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy sesuai modul
    return DashboardData(
      userName: 'Admin D4TI',
      lastUpdate: DateTime.now(),
      stats: [
        DashboardStats(
          title: 'Mahasiswa',
          value: '1,234',
          subtitle: 'Mahasiswa terdaftar',
          // percentage: 8.5,
          // isIncrease: true,
        ),
        DashboardStats(
          title: 'Mahasiswa Aktif',
          value: '1,180',
          subtitle: 'Sedang kuliah',
          // percentage: 5.2,
          // isIncrease: true,
        ),
        DashboardStats(
          title: 'Dosen',
          value: '650',
          subtitle: 'Dosen pengajar',
          // percentage: 2.1,
          // isIncrease: false,
        ),
        DashboardStats(
          title: 'Profil',
          value: '100%',
          subtitle: 'Tahun ini',
          // percentage: 3.5,
          // isIncrease: true,
        ),
      ],
    );
  }

  // Refresh dashboard data
  Future<DashboardData> refreshDashboard() async {
    return getDashboardData();
  }

  // Get specific stat by title
  Future<DashboardStats?> getStatByTitle(String title) async {
    final data = await getDashboardData();
    try {
      return data.stats.firstWhere((stat) => stat.title == title);
    } catch (e) {
      return null;
    }
  }
}