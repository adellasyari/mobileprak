import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprak/core/widgets/common_widgets.dart';
import '../providers/mahasiswa_aktif_provider.dart';
import '../widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mahasiswa Aktif'), actions: [
        IconButton(icon: const Icon(Icons.refresh), onPressed: () => ref.invalidate(mahasiswaAktifNotifierProvider))
      ]),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (err, stack) => CustomErrorWidget(message: err.toString(), onRetry: () => ref.refresh(mahasiswaAktifNotifierProvider)),
        data: (list) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(mahasiswaAktifNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (ctx, i) => ModernMahasiswaAktifCard(mahasiswaAktif: list[i]),
          ),
        ),
      ),
    );
  }
}