import 'package:absensi_fic/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle h1 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 18,
    fontWeight: bold,
    height: 1.2,
    letterSpacing: 0.5,
    fontFamily: GoogleFonts.kumbhSans().fontFamily,
  );
  static TextStyle h2 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 16,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0.5,
    fontFamily: GoogleFonts.kumbhSans().fontFamily,
  );
  static TextStyle h3 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 15,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0.5,
    fontFamily: GoogleFonts.kumbhSans().fontFamily,
  );
  static TextStyle h4 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 14,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0.5,
    fontFamily: GoogleFonts.kumbhSans().fontFamily,
  );

  static TextStyle regularStyle = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 12,
    fontWeight: regular,
    height: 1.2,
    letterSpacing: 0.5,
    fontFamily: GoogleFonts.kumbhSans().fontFamily,
  );

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}
