import 'package:absensi_fic/core/constants/app_colors.dart';
import 'package:absensi_fic/presentation/auth/login_page.dart';
import 'package:absensi_fic/presentation/auth/register_page.dart';
import 'package:absensi_fic/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        dividerTheme: DividerThemeData(color: AppColors.light.withOpacity(0.5)),
        dialogTheme: const DialogTheme(elevation: 0),
        textTheme: GoogleFonts.kumbhSansTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.kumbhSans(
            color: AppColors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const RegisterPage(),
    );
  }
}
