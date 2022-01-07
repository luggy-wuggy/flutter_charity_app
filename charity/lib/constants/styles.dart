import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle kTitle = GoogleFonts.lora(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
  ),
);

final TextStyle kCategorySelected = GoogleFonts.lato(
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 16,
  ),
);

final TextStyle kCategoryUnselected = GoogleFonts.lato(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xFF9E9E9E),
    fontSize: 15,
  ),
);

final TextStyle kCategorySelectedBig = GoogleFonts.lato(
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 23,
  ),
);

final TextStyle kCategoryUnselectedBig = GoogleFonts.lato(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontSize: 18,
  ),
);
