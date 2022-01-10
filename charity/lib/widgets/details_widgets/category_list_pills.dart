import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListPills extends StatelessWidget {
  const CategoryListPills({
    Key? key,
    required this.category,
    required this.cause,
  }) : super(key: key);

  final String category;
  final String cause;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
        children: [
          CategoryPill(
            title: category,
            color: const Color(0xFFF6B573),
          ),
          const SizedBox(width: 8),
          CategoryPill(
            title: cause,
            color: const Color(0xFF579FE6),
          ),
        ],
      ),
    );
  }
}

class CategoryPill extends StatelessWidget {
  const CategoryPill({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
