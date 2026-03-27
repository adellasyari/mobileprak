import 'package:mobileprak/core/network/dio_client.dart';
import 'package:mobileprak/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

class DosenRepository {
  final DioClient _dioClient;

  DosenRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// get data daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    try {
      // Memanggil endpoint '/users' melalui dioClient
      final Response response = await _dioClient.dio.get('/users');
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Gagal memuat data dosen: ${e.response?.statusCode} ${e.message}');
    }
  }
}