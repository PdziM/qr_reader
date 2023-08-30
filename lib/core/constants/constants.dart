import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapping_colors.dart';

const IconThemeData _iconThemeData =
    IconThemeData(color: Colors.black54, size: 26);

TextTheme _lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
  headlineLarge: GoogleFonts.poppins(
      fontSize: 32, fontWeight: FontWeight.w400, color: Colors.black),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.w400, color: Colors.black),
  headlineSmall: GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
  titleLarge: GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
  titleMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  titleSmall: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
      height: 1),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
  bodySmall: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
  labelSmall: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black45),
);

TextTheme _darkTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
  headlineLarge: GoogleFonts.poppins(
      fontSize: 32, fontWeight: FontWeight.w400, color: Colors.white),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
  headlineSmall: GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
  titleLarge: GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
  titleMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
  titleSmall: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white54,
      height: 1),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white54),
  bodySmall: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white54),
  labelSmall: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white38),
);

ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: ColorsConstants.primary100,
    scaffoldBackgroundColor: ColorsConstants.bg100,
    useMaterial3: true,
    iconTheme: _iconThemeData,
    textTheme: _lightTextTheme);

ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: ColorsConstants.primary100,
    useMaterial3: true,
    iconTheme: _iconThemeData,
    textTheme: _darkTextTheme);

const LinearGradient appGradient = LinearGradient(colors: [
  ColorsConstants.accent100,
  ColorsConstants.primary100,
], begin: Alignment.topLeft, end: Alignment.bottomRight);

const LinearGradient headerGradient = LinearGradient(colors: [
  ColorsConstants.accent100,
  ColorsConstants.primary100,
], begin: Alignment.topCenter, end: Alignment.bottomCenter);

ThemeData getTheme(bool darkTheme) {
  return darkTheme == true ? darkThemeData : lightThemeData;
}

double appBarHeight = AppBar().preferredSize.height;

BoxDecoration customDecoration(context, {Color? color}) {
  return BoxDecoration(
    color: color ?? Colors.grey[300]!,
    borderRadius: BorderRadius.circular(10),
  );
}
