import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/dosen_model.dart';
import '../../data/repositories/dosen_repository.dart';

// Provider untuk Repository Dosen
final dosenRepositoryProvider = Provider<DosenRepository>((ref) {
  return DosenRepository();
});

// StateNotifier untuk mengelola state data dosen
class DosenNotifier extends StateNotifier<AsyncValue<List<DosenModel>>> {
  final DosenRepository _repository;

  DosenNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadDosenList();
  }

  // Fungsi memuat data
  Future<void> loadDosenList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getDosenList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // Fungsi memuat ulang data (refresh)
  Future<void> refresh() async {
    await loadDosenList();
  }
}

// Provider utama untuk DosenNotifier
final dosenNotifierProvider = StateNotifierProvider.autoDispose<
    DosenNotifier,
    AsyncValue<List<DosenModel>>
>((ref) {
  final repository = ref.watch(dosenRepositoryProvider);
  return DosenNotifier(repository);
});