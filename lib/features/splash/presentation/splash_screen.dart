import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../onboarding/presentation/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Spacer(flex: 4),
                  // Logo exactly centered
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/ABUDEVS.jpg',
                          height: 220,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.rocket_launch_rounded,
                            size: 140,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Ahmadu Bello University Developers Club\n(ABUDevs)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                  // Title & Subheading
                  const Text(
                    'UNIV MATERIALS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your academic resource hub',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryGreen.withOpacity(0.6),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(flex: 2),
                  // Progress Section at the bottom
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return LinearProgressIndicator(
                              value: _controller.value,
                              backgroundColor: AppColors.primaryGreen.withOpacity(0.1),
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
                              minHeight: 4,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'INITIALIZING SYSTEMS',
                        style: TextStyle(
                          color: AppColors.primaryGreen.withOpacity(0.4),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
