import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../providers/dosen_provider.dart';
import '../widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Memantau state dari dosenNotifierProvider
    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              // Refresh data saat tombol ditekan
              ref.invalidate(dosenNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      // Menampilkan tampilan berdasarkan state (loading, error, atau data)
      body: dosenState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data dosen: ${error.toString()}',
          onRetry: () {
            ref.read(dosenNotifierProvider.notifier).refresh();
          },
        ),
        data: (dosenList) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dosenNotifierProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: dosenList.length,
              itemBuilder: (context, index) {
                // Memanggil desain kartu dosen yang sudah dibuat
                return ModernDosenCard(dosen: dosenList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}