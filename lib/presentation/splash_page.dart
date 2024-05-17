import 'package:absensi_fic/core/assets/assets.dart';
import 'package:absensi_fic/core/components/spaces.dart';
import 'package:absensi_fic/core/constants/app_colors.dart';
import 'package:absensi_fic/core/extensions/build_context_ext.dart';
import 'package:absensi_fic/presentation/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Assets.images.logoWhite.image(),
          const Spacer(),
          Assets.images.logoCodeWithBahri.image(height: 70.0),
          const SpaceHeight(20.0),
        ],
      ),
    );
  }
}
