import 'package:dio/dio.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa dari API comments
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/comments',
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => MahasiswaModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }
}