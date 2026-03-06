import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/dashboard_widgets.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Memantau (watch) data dari provider secara langsung
    final dashboardState = ref.watch(dashboardNotifierProvider);
    final selectedIndex = ref.watch(selectedStatIndexProvider);

    return Scaffold(
      body: dashboardState.when(
        // 1. Tampilan saat data sedang dimuat (Loading)
        loading: () => const LoadingWidget(),
        
        // 2. Tampilan saat terjadi error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () {
            ref.read(dashboardNotifierProvider.notifier).refresh();
          },
        ),
        
        // 3. Tampilan saat data berhasil diambil
        data: (dashboardData) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(dashboardNotifierProvider.notifier).refresh();
            },
            child: CustomScrollView(
              slivers: [
                // Bagian Header Biru
                SliverToBoxAdapter(
                  child: DashboardHeader(userName: dashboardData.userName),
                ),
                
                // Bagian Kartu Statistik
                SliverPadding(
                  padding: const EdgeInsets.all(AppConstants.paddingMedium),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Statistik",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingMedium),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppConstants.paddingMedium,
                            mainAxisSpacing: AppConstants.paddingMedium,
                            childAspectRatio: 1.3,
                          ),
                          itemCount: dashboardData.stats.length,
                          itemBuilder: (context, index) {
                            return StatCard(
                              stats: dashboardData.stats[index],
                              isSelected: selectedIndex == index,
                              onTap: () {
                                // Mengubah status kartu yang dipilih
                                ref.read(selectedStatIndexProvider.notifier).state = index;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Spasi bawah
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: AppConstants.paddingLarge),
                ),
              ],
            ),
          );
        },
      ),
      
      // Tombol Refresh Mengambang
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(dashboardNotifierProvider.notifier).refresh();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Memperbarui data...'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}