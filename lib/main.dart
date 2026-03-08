import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Wajib untuk Riverpod
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  // Aplikasi wajib dibungkus dengan ProviderScope agar Riverpod bisa menyala
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Memanggil tema desain yang sudah kita buat
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const DashboardPage(), // Memanggil halaman yang baru saja kita rakit
    );
  }
}