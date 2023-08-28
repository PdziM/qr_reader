import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapping_colors.dart';

const IconThemeData _iconThemeData =
    IconThemeData(color: Colors.black54, size: 26);

TextTheme _textTheme = GoogleFonts.poppinsTextTheme().copyWith(
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

ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstants.primary200),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    cardColor: Colors.white,
    iconTheme: _iconThemeData,
    textTheme: _textTheme);

const LinearGradient appGradient = LinearGradient(colors: [
  ColorsConstants.primary100,
  ColorsConstants.primary200,
], begin: Alignment.topLeft, end: Alignment.bottomRight);

double appBarHeight = AppBar().preferredSize.height;

BoxDecoration customDecoration(context, {Color? color}) {
  return BoxDecoration(
    color: color ?? Colors.grey[300]!,
    borderRadius: BorderRadius.circular(10),
  );
}
