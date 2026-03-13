import 'package:dio/dio.dart';
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => MahasiswaAktifModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }
}