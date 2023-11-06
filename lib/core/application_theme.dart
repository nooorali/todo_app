import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static const primaryColor = Color(0xFF5C9BEA);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      onPrimary: const Color(0xFFDEEADA),
      onSecondary: Colors.black,
      onBackground: Colors.white,


    ),
    scaffoldBackgroundColor: const Color(0xFFDEEADA),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 100,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,

    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      onPrimary: const Color(0xFF060E1E),
      onSecondary: Colors.white,
      onBackground: const Color(0xFF141922),
    ),
    scaffoldBackgroundColor: const Color(0xFF060E1E),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 160,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141922),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,

    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
