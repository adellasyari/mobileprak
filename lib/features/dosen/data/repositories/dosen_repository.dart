import 'package:dio/dio.dart';
import '../models/dosen_model.dart';

class DosenRepository {
  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => DosenModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }
}