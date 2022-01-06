import 'package:charity/models/charity_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 28,
              color: Colors.grey[900],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.favorite_border_rounded,
              size: 28,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
