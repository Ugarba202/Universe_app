import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_themes.dart';
import 'features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MaterialsApp()));
}

class MaterialsApp extends StatelessWidget {
  const MaterialsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Materials',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
