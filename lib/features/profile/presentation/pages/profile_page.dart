import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../providers/profile_provider.dart';
import '../widgets/profile_widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya'), elevation: 0),
      body: profileState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: error.toString(),
          onRetry: () => ref.read(profileNotifierProvider.notifier).refresh(),
        ),
        data: (profile) {
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(profileNotifierProvider),
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                ModernProfileCard(profile: profile), // Memanggil kartu profil raksasa
              ],
            ),
          );
        },
      ),
    );
  }
}