import 'package:charity/models/charity_info.dart';
import 'package:charity/widgets/details_widgets/charity_title.dart';
import 'package:charity/widgets/details_widgets/details_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsHeader(charity: charity),
            const SizedBox(height: 20),
            CharityTitle(charity: charity),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "${charity.mission}",
                style: GoogleFonts.lora(
                  textStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
