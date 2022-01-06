import 'package:charity/models/charity_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityTitle extends StatelessWidget {
  const CharityTitle({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${charity.charityName}",
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${charity.mailingAddress?.city}, ${charity.mailingAddress?.stateOrProvince}",
            style: GoogleFonts.lora(
              textStyle: TextStyle(
                color: Colors.grey[800],
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
